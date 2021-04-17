# This Terraform module deploys random-named S3 bucket with objects, and a log bucket to send the logs
- Main initial features are:
  - KMS key is used to encrypt bucket objects,
  - Logging is enabled, and a log bucket will be created within the main bucket,
  - Tags can be added as a variable,
  - Versioning is enabled.
- To use this module fallow the steps below:
  - Clone the repo:
    ```bash
    git clone https://github.com/bluehackrafestefano/S3moduleTerraformTask.git
    ```
