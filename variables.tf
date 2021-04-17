# Variable declarations

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {
      Name        = "Terraform bucket"
      Environment = "Dev"
  }
}