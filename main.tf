resource "aws_budgets_budget" "daily" {
  name         = "daily-budget"
  budget_type  = "COST"
  limit_amount = var.daily_limit
  limit_unit   = "USD"
  time_unit    = "DAILY"
}
