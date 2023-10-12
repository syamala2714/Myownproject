variable "instance_name" {}
variable "ami_id" {}
variable "instance_type" {}

variable "s3_bucket_name" {}

variable "acl_type" {
    type = string
    default = "private"
}