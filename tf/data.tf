#Get data for existing lambda layer to use for application dependencies
data "aws_lambda_layer_version" "layer" {
  layer_name = var.layer_name
}
