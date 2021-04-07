variable "role_arn" {
  type        = string
  description = "IAM Roles to be attached to the sagemaker notebook instance."
  default = "arn:aws:iam::111111111111:role/lakeformation-glue-sagemaker-notebook"
}

variable "instance_type" {
  type        = string
  description = "."
  default = "ml.t2.medium"
}

variable "lifecycle_config_name" {
  type        = string
  description = "."
  default = "aws-glue-sagemaker-notebook-starter-LCConfig"
}

variable "glue_dev_endpoint_name" {
  type        = string
  description = "."
  default = "sagemaker-glue-nb"
}

variable "sagemaker_notebook_instance_name" {
  type        = string
  description = "."
  default = "aws-glue-sagemaker-notebook-starter"
}
