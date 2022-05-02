variable "region" {
  description = "AWS region to deploy the application in"
}

variable "project_name" {
  description = "Name of the project for this application"
}

variable "layer_name" {
  description = "Name of existing lambda layer to use for application dependencies"
}

variable "telegram_chat_id" {
  description = "ID of the telegram chat to post notifications to"
}

variable "telegram_token" {
  description = "Token for the telegram chat to post notifications to"
}

variable "hometowork" {
  description = "URL for the home to work bus stop"
}

variable "worktohome" {
  description = "URL for the work to home bus stop"
}
