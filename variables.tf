variable "daily_limit" {
  type = number
}

variable "monthly_limit" {
  type = number
}

variable "telegram_token" {
  type      = string
  sensitive = true
}

variable "telegram_chat_id" {
  type      = string
  sensitive = true
}
