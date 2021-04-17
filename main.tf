terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_kms_key" "objects" {
  description             = "KMS key is used to encrypt bucket objects"
  deletion_window_in_days = 7
}

resource "random_pet" "bucket_name" {
  length    = 5
  separator = "-"
  prefix    = "dev"
}

module "log_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket                                = "logs-${random_pet.bucket_name.id}"
  acl                                   = "log-delivery-write"
  force_destroy                         = true
  attach_elb_log_delivery_policy        = true
  attach_deny_insecure_transport_policy = true
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = random_pet.bucket_name.id
  acl    = "private"

  attach_deny_insecure_transport_policy = true

  versioning = {
    enabled = true
  }
  
  tags = var.tags

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.objects.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  logging = {
    target_bucket = module.log_bucket.this_s3_bucket_id
    target_prefix = "log/"
  }
}

resource "random_pet" "object_names" {
  count     = 4
  length    = 5
  separator = "_"
  prefix    = "learning"
}

resource "aws_s3_bucket_object" "objects" {
  count       = 4

  acl          = "public-read"
  key          = "${random_pet.object_names[count.index].id}.txt"
  bucket       = module.s3_bucket.this_s3_bucket_id
  # content      = "Example object #${count.index}"
  content      = "Bucket object #${count.index}"
  content_type = "text/plain"
}
