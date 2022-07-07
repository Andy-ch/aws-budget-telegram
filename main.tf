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
