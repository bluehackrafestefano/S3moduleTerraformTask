output "bucket_name" {
  description = "Randomly generated bucket name."
  # value       = random_pet.bucket_name.id
  value       = module.s3_bucket.this_s3_bucket_id
}

output "bucket_arn" {
  description = "ARN of bucket"
  value       = module.s3_bucket.this_s3_bucket_arn
}

output "log_bucket_id" {
  description = "The name of the log bucket."
  value       = module.log_bucket.this_s3_bucket_id
}

output "log_bucket_arn" {
  description = "The ARN of the log bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.log_bucket.this_s3_bucket_arn
}