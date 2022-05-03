#Create IAM role for Lambda function
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}

#Create Lambda function
resource "aws_lambda_function" "bus_notifier" {
  filename         = "../src/lambda.zip"
  function_name    = "bus-notifier"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "main.scrape"
  source_code_hash = filebase64sha256("../src/lambda.zip")
  runtime          = "python3.9"
  layers           = [data.aws_lambda_layer_version.layer.arn]
  architectures    = ["arm64"]

  environment {
    variables = {
      TELEGRAM_CHAT_ID = var.telegram_chat_id
      TELEGRAM_TOKEN   = var.telegram_token
      HOMETOWORK       = var.hometowork
      WORKTOHOME       = var.worktohome
    }
  }

}
