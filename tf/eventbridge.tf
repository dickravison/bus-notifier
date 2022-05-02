resource "aws_cloudwatch_event_rule" "hometowork" {
  name        = "${var.project_name}-hometowork"
  description = "Rule to invoke bus notifiter for home to work journey"

  schedule_expression = "cron(0 07 * * ? *)"
}

resource "aws_cloudwatch_event_rule" "worktohome" {
  name        = "${var.project_name}-worktohome"
  description = "Rule to invoke bus notifiter for work to home journey"

  schedule_expression = "cron(0 16 * * ? *)"
}

resource "aws_cloudwatch_event_target" "hometowork" {
  rule      = aws_cloudwatch_event_rule.hometowork.name
  target_id = "HomeToWorkBusNotifier"
  arn       = aws_lambda_function.bus_notifier.arn
}

resource "aws_cloudwatch_event_target" "worktohome" {
  rule      = aws_cloudwatch_event_rule.worktohome.name
  target_id = "WorkToHomeBusNotifier"
  arn       = aws_lambda_function.bus_notifier.arn
}

