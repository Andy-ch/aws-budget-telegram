resource "aws_budgets_budget" "daily" {
  name         = "daily-budget"
  budget_type  = "COST"
  limit_amount = var.daily_limit
  limit_unit   = "USD"
  time_unit    = "DAILY"
}

resource "aws_budgets_budget" "monthly" {
  name         = "monthly-budget"
  budget_type  = "COST"
  limit_amount = var.monthly_limit
  limit_unit   = "USD"
  time_unit    = "MONTHLY"
}

resource "aws_iam_role" "notifier" {
  name               = "budget_telegram_notifier"
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
}

resource "aws_lambda_function" "notifier" {
  filename      = "lambda.zip"
  function_name = "budget_telegram_notifier"
  role          = aws_iam_role.notifier.arn
  handler       = "lambda.lambda_handler"
  runtime       = "python3.9"
  environment {
    variables = {
      TOKEN   = var.telegram_token
      CHAT_ID = var.telegram_chat_id
    }
  }
}
