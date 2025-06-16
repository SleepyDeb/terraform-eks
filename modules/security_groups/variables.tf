variable "name" {
    description = "Deployment name to use as resource prefix"
    type = string
}

variable "vpc_id" {
    description = "VPC ID"
    type = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = { }
}