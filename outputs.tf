output "model_servings_id" {
  description = "Map of id values across all model_servings, keyed the same as var.model_servings except keys with no id are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "model_servings_ai_gateway" {
  description = "Map of ai_gateway values across all model_servings, keyed the same as var.model_servings except keys with no ai_gateway are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => one(v.ai_gateway) if v.ai_gateway != null && length(v.ai_gateway) > 0 }
}
output "model_servings_budget_policy_id" {
  description = "Map of budget_policy_id values across all model_servings, keyed the same as var.model_servings except keys with no budget_policy_id are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => v.budget_policy_id if v.budget_policy_id != null && length(v.budget_policy_id) > 0 }
}
output "model_servings_config" {
  description = "Map of config values across all model_servings, keyed the same as var.model_servings except keys with no config are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => one(v.config) if v.config != null && length(v.config) > 0 }
  sensitive   = true
}
output "model_servings_description" {
  description = "Map of description values across all model_servings, keyed the same as var.model_servings except keys with no description are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => v.description if v.description != null && length(v.description) > 0 }
}
output "model_servings_email_notifications" {
  description = "Map of email_notifications values across all model_servings, keyed the same as var.model_servings except keys with no email_notifications are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => one(v.email_notifications) if v.email_notifications != null && length(v.email_notifications) > 0 }
}
output "model_servings_endpoint_url" {
  description = "Map of endpoint_url values across all model_servings, keyed the same as var.model_servings except keys with no endpoint_url are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => v.endpoint_url if v.endpoint_url != null && length(v.endpoint_url) > 0 }
}
output "model_servings_name" {
  description = "Map of name values across all model_servings, keyed the same as var.model_servings except keys with no name are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => v.name if v.name != null && length(v.name) > 0 }
}
output "model_servings_provider_config" {
  description = "Map of provider_config values across all model_servings, keyed the same as var.model_servings except keys with no provider_config are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}
output "model_servings_rate_limits" {
  description = "Map of rate_limits values across all model_servings, keyed the same as var.model_servings except keys with no rate_limits are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => v.rate_limits if v.rate_limits != null && length(v.rate_limits) > 0 }
}
output "model_servings_route_optimized" {
  description = "Map of route_optimized values across all model_servings, keyed the same as var.model_servings except keys with no route_optimized are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => v.route_optimized if v.route_optimized != null }
}
output "model_servings_serving_endpoint_id" {
  description = "Map of serving_endpoint_id values across all model_servings, keyed the same as var.model_servings except keys with no serving_endpoint_id are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => v.serving_endpoint_id if v.serving_endpoint_id != null && length(v.serving_endpoint_id) > 0 }
}
output "model_servings_tags" {
  description = "Map of tags values across all model_servings, keyed the same as var.model_servings except keys with no tags are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "model_servings_telemetry_config" {
  description = "Map of telemetry_config values across all model_servings, keyed the same as var.model_servings except keys with no telemetry_config are omitted"
  value       = { for k, v in databricks_model_serving.model_servings : k => one(v.telemetry_config) if v.telemetry_config != null && length(v.telemetry_config) > 0 }
}

