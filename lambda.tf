module "DemoAPILambda" {
  source = "terraform-aws-modules/lambda/aws"
  publish = true
  function_name = "DemoAPILambda"
  description   = "Returns demo API response"
  handler       = "DemoAPILambda.lambda_handler"
  runtime       = "python3.8"
  source_path = "./src/DemoAPILambda.py"
  tags = {
    Name = "DemoAPILambda"
  }
  allowed_triggers = {
    APIGatewayAny = {
      service = "apigateway"
      arn     = aws_api_gateway_rest_api.DemoAPI.execution_arn
    }
  }
  attach_policy = false
}