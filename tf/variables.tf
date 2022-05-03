variable "region" {
  type        = string
  description = "AWS region to deploy the application in"
}

variable "project_name" {
  type        = string
  description = "Name of the project for this application"
}

variable "layer_name" {
  type        = string
  description = "Name of existing lambda layer to use for application dependencies"
}

variable "telegram_chat_id" {
  type        = string
  description = "ID of the telegram chat to post notifications to"
}

variable "telegram_token" {
  type        = string
  description = "Token for the telegram chat to post notifications to"
}

variable "hometowork" {
  type        = string
  description = "URL for the home to work bus stop"
}

variable "worktohome" {
  type        = string
  description = "URL for the work to home bus stop"
}

variable "cron" {
  type        = string
  description = "Cron to determine when to run notification for home to work journey"
}

