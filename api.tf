resource "aws_api_gateway_rest_api" "DemoAPI" {
  name        = "DemoAPI"
  description = "Simple Demo API project"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "DemoAPIDeployment" {
  depends_on = [module.BaseResource]
  rest_api_id = aws_api_gateway_rest_api.DemoAPI.id
  stage_name  = "test"
  lifecycle {
    create_before_destroy = true
  }
}

module "BaseResource" {
  source = "mewa/serverless-resource/aws"
  version = "2.0.0"
  api = aws_api_gateway_rest_api.DemoAPI.id
  root_resource = aws_api_gateway_rest_api.DemoAPI.root_resource_id
  resource = "api"
  methods = [
    {
      method = "GET"
      type = "AWS_PROXY"
      invoke_arn = module.DemoAPILambda.lambda_function_invoke_arn
    },
    {
        method = "POST"
        type = "AWS_PROXY"
        invoke_arn = module.DemoAPILambda.lambda_function_invoke_arn
    }
  ]
}