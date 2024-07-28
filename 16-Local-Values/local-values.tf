# Local Values Block

locals {
  rg_name = "${var.business_unit}-${var.environment}-${var.resource_group_name}"
  vnet_name = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"

  service_name = "Demo App"
  owner = "KR"
  common_tags = {
    Service = local.service_name
    Owner = local.owner
  } 
}  
