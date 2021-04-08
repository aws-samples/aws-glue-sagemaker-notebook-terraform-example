
resource "aws_sagemaker_notebook_instance" "nb" {
  name          = var.sagemaker_notebook_instance_name
  role_arn      = var.role_arn
  instance_type = var.instance_type
  lifecycle_config_name = aws_sagemaker_notebook_instance_lifecycle_configuration.aws-glue-sagemaker-lifecycle.name

  tags = {
    Name = "vehicle"
    aws-glue-dev-endpoint = aws_glue_dev_endpoint.glue-endpoint.name

  }
}

resource "aws_glue_dev_endpoint" "glue-endpoint" {
  name     = var.glue_dev_endpoint_name
  role_arn = var.role_arn
  glue_version = "1.0"
  number_of_workers = "5"
  worker_type = "G.1X"
  arguments = {"--enable-glue-datacatalog": "","GLUE_PYTHON_VERSION": "3"}

}

resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "aws-glue-sagemaker-lifecycle" {
  name      = var.lifecycle_config_name
  on_create = base64encode( templatefile ("${path.module}/on-create.sh", { "glueendpoint": aws_glue_dev_endpoint.glue-endpoint.name}) )

  on_start  = base64encode( templatefile ("${path.module}/on-start.sh",  { "glueendpoint": aws_glue_dev_endpoint.glue-endpoint.name}) )
}
