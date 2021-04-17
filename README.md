## This Terraform module deploys random-named S3 bucket with objects, and a log bucket to send the logs
- Main initial features are:
  - KMS key is used to encrypt bucket objects,
  - Logging is enabled, and a log bucket will be created within the main bucket,
  - Tags can be added as a variable,
  - Versioning is enabled,
  - A random name will be assignend to the bucket,
  - Bucket will be private.

### How to use
- To use this module fallow the steps below:
  - Clone the repo:
    ```bash
    git clone https://github.com/bluehackrafestefano/S3moduleTerraformTask.git
    ```
  - Navigate to the repository directory.
  - Initialize the Terraform project.
  ```bash
  terraform init
  ```
  - Make a plan and investigate the resources you are about to provision.
  ```bash
  terraform plan
  ```
  - Apply this configuration to create your S3 bucket and objects.
  ```bash
  terraform apply
  ```
  - Confirm by typing yes at the prompt.

### Variables
- Region, default is "us-east-1"
- Tags, defaults are "Terraform bucket" and "Dev".

### Outputs
- Bucket name and arn,
- Log bucket name and arn.

### Source Notes
- In this module "terraform-aws-modules/s3-bucket/aws" is used as a source.