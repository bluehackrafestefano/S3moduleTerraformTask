# Variable declarations

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# variable "versioning" {
#   description = "Map containing versioning configuration."
#   # type        = map(string)
#   default     = true
# }

# variable "logging" {
#   description = "Map containing access bucket logging configuration."
#   type        = map(string)
#   default     = {}
# }

# variable "tags" {
#   description = "(Optional) A mapping of tags to assign to the bucket."
#   type        = map(string)
#   default     = {}
# }