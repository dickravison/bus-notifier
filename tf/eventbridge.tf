#Create Eventbridge rule to invoke Lambda function each day at specific time
resource "aws_cloudwatch_event_rule" "notifier" {
  name        = "${var.project_name}"
  description = "Rule to invoke bus notifier function"

  schedule_expression = var.cron
}

#Link Eventbridge rule to Lambda function
resource "aws_cloudwatch_event_target" "notifier" {
  rule      = aws_cloudwatch_event_rule.notifier.name
  target_id = "BusNotifier"
  arn       = aws_lambda_function.bus_notifier.arn
}

