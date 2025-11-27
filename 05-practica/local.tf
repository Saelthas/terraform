locals {
  common_tags = {
    project_name = var.project_name
    environment  = var.environment
    owner        = "RubenAruzamen"
    manage_by    = "Terraform"
  }
  prefix = "${local.common_tags.owner}-${var.environment}"

}