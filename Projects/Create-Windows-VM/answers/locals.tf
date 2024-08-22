locals {
  # Resource Group
  resource_group_name = "${var.app_name}-${var.environment}-rg"

  # Resource Prefix
  resource_prefix = "${var.app_name}-${var.environment}"

  # Storage Account prefix
  storage_account_prefix = "${var.app_name}${var.environment}"
}