resource "databricks_model_serving" "model_servings" {
  for_each = var.model_servings

  name             = each.value.name
  budget_policy_id = each.value.budget_policy_id
  description      = each.value.description
  route_optimized  = each.value.route_optimized

  dynamic "ai_gateway" {
    for_each = each.value.ai_gateway != null ? [each.value.ai_gateway] : []
    content {
      dynamic "fallback_config" {
        for_each = ai_gateway.value.fallback_config != null ? [ai_gateway.value.fallback_config] : []
        content {
          enabled = fallback_config.value.enabled
        }
      }
      dynamic "guardrails" {
        for_each = ai_gateway.value.guardrails != null ? [ai_gateway.value.guardrails] : []
        content {
          dynamic "input" {
            for_each = guardrails.value.input != null ? [guardrails.value.input] : []
            content {
              invalid_keywords = input.value.invalid_keywords
              dynamic "pii" {
                for_each = input.value.pii != null ? [input.value.pii] : []
                content {
                  behavior = pii.value.behavior
                }
              }
              safety       = input.value.safety
              valid_topics = input.value.valid_topics
            }
          }
          dynamic "output" {
            for_each = guardrails.value.output != null ? [guardrails.value.output] : []
            content {
              invalid_keywords = output.value.invalid_keywords
              dynamic "pii" {
                for_each = output.value.pii != null ? [output.value.pii] : []
                content {
                  behavior = pii.value.behavior
                }
              }
              safety       = output.value.safety
              valid_topics = output.value.valid_topics
            }
          }
        }
      }
      dynamic "inference_table_config" {
        for_each = ai_gateway.value.inference_table_config != null ? [ai_gateway.value.inference_table_config] : []
        content {
          catalog_name      = inference_table_config.value.catalog_name
          enabled           = inference_table_config.value.enabled
          schema_name       = inference_table_config.value.schema_name
          table_name_prefix = inference_table_config.value.table_name_prefix
        }
      }
      dynamic "rate_limits" {
        for_each = ai_gateway.value.rate_limits != null ? ai_gateway.value.rate_limits : []
        content {
          calls          = rate_limits.value.calls
          key            = rate_limits.value.key
          principal      = rate_limits.value.principal
          renewal_period = rate_limits.value.renewal_period
          tokens         = rate_limits.value.tokens
        }
      }
      dynamic "usage_tracking_config" {
        for_each = ai_gateway.value.usage_tracking_config != null ? [ai_gateway.value.usage_tracking_config] : []
        content {
          enabled = usage_tracking_config.value.enabled
        }
      }
    }
  }

  dynamic "config" {
    for_each = each.value.config != null ? [each.value.config] : []
    content {
      dynamic "auto_capture_config" {
        for_each = config.value.auto_capture_config != null ? [config.value.auto_capture_config] : []
        content {
          catalog_name      = auto_capture_config.value.catalog_name
          enabled           = auto_capture_config.value.enabled
          schema_name       = auto_capture_config.value.schema_name
          table_name_prefix = auto_capture_config.value.table_name_prefix
        }
      }
      dynamic "served_entities" {
        for_each = config.value.served_entities != null ? config.value.served_entities : []
        content {
          burst_scaling_enabled = served_entities.value.burst_scaling_enabled
          entity_name           = served_entities.value.entity_name
          entity_version        = served_entities.value.entity_version
          environment_vars      = served_entities.value.environment_vars
          dynamic "external_model" {
            for_each = served_entities.value.external_model != null ? [served_entities.value.external_model] : []
            content {
              dynamic "ai21labs_config" {
                for_each = external_model.value.ai21labs_config != null ? [external_model.value.ai21labs_config] : []
                content {
                  ai21labs_api_key           = ai21labs_config.value.ai21labs_api_key
                  ai21labs_api_key_plaintext = ai21labs_config.value.ai21labs_api_key_plaintext
                }
              }
              dynamic "amazon_bedrock_config" {
                for_each = external_model.value.amazon_bedrock_config != null ? [external_model.value.amazon_bedrock_config] : []
                content {
                  aws_access_key_id               = amazon_bedrock_config.value.aws_access_key_id
                  aws_access_key_id_plaintext     = amazon_bedrock_config.value.aws_access_key_id_plaintext
                  aws_region                      = amazon_bedrock_config.value.aws_region
                  aws_secret_access_key           = amazon_bedrock_config.value.aws_secret_access_key
                  aws_secret_access_key_plaintext = amazon_bedrock_config.value.aws_secret_access_key_plaintext
                  bedrock_provider                = amazon_bedrock_config.value.bedrock_provider
                  instance_profile_arn            = amazon_bedrock_config.value.instance_profile_arn
                  uc_service_credential_name      = amazon_bedrock_config.value.uc_service_credential_name
                }
              }
              dynamic "anthropic_config" {
                for_each = external_model.value.anthropic_config != null ? [external_model.value.anthropic_config] : []
                content {
                  anthropic_api_key           = anthropic_config.value.anthropic_api_key
                  anthropic_api_key_plaintext = anthropic_config.value.anthropic_api_key_plaintext
                }
              }
              dynamic "cohere_config" {
                for_each = external_model.value.cohere_config != null ? [external_model.value.cohere_config] : []
                content {
                  cohere_api_base          = cohere_config.value.cohere_api_base
                  cohere_api_key           = cohere_config.value.cohere_api_key
                  cohere_api_key_plaintext = cohere_config.value.cohere_api_key_plaintext
                }
              }
              dynamic "custom_provider_config" {
                for_each = external_model.value.custom_provider_config != null ? [external_model.value.custom_provider_config] : []
                content {
                  dynamic "api_key_auth" {
                    for_each = custom_provider_config.value.api_key_auth != null ? [custom_provider_config.value.api_key_auth] : []
                    content {
                      key             = api_key_auth.value.key
                      value           = api_key_auth.value.value
                      value_plaintext = api_key_auth.value.value_plaintext
                    }
                  }
                  dynamic "bearer_token_auth" {
                    for_each = custom_provider_config.value.bearer_token_auth != null ? [custom_provider_config.value.bearer_token_auth] : []
                    content {
                      token           = bearer_token_auth.value.token
                      token_plaintext = bearer_token_auth.value.token_plaintext
                    }
                  }
                  custom_provider_url = custom_provider_config.value.custom_provider_url
                }
              }
              dynamic "databricks_model_serving_config" {
                for_each = external_model.value.databricks_model_serving_config != null ? [external_model.value.databricks_model_serving_config] : []
                content {
                  databricks_api_token           = databricks_model_serving_config.value.databricks_api_token
                  databricks_api_token_plaintext = databricks_model_serving_config.value.databricks_api_token_plaintext
                  databricks_workspace_url       = databricks_model_serving_config.value.databricks_workspace_url
                }
              }
              dynamic "google_cloud_vertex_ai_config" {
                for_each = external_model.value.google_cloud_vertex_ai_config != null ? [external_model.value.google_cloud_vertex_ai_config] : []
                content {
                  private_key           = google_cloud_vertex_ai_config.value.private_key
                  private_key_plaintext = google_cloud_vertex_ai_config.value.private_key_plaintext
                  project_id            = google_cloud_vertex_ai_config.value.project_id
                  region                = google_cloud_vertex_ai_config.value.region
                }
              }
              name = external_model.value.name
              dynamic "openai_config" {
                for_each = external_model.value.openai_config != null ? [external_model.value.openai_config] : []
                content {
                  microsoft_entra_client_id               = openai_config.value.microsoft_entra_client_id
                  microsoft_entra_client_secret           = openai_config.value.microsoft_entra_client_secret
                  microsoft_entra_client_secret_plaintext = openai_config.value.microsoft_entra_client_secret_plaintext
                  microsoft_entra_tenant_id               = openai_config.value.microsoft_entra_tenant_id
                  openai_api_base                         = openai_config.value.openai_api_base
                  openai_api_key                          = openai_config.value.openai_api_key
                  openai_api_key_plaintext                = openai_config.value.openai_api_key_plaintext
                  openai_api_type                         = openai_config.value.openai_api_type
                  openai_api_version                      = openai_config.value.openai_api_version
                  openai_deployment_name                  = openai_config.value.openai_deployment_name
                  openai_organization                     = openai_config.value.openai_organization
                }
              }
              dynamic "palm_config" {
                for_each = external_model.value.palm_config != null ? [external_model.value.palm_config] : []
                content {
                  palm_api_key           = palm_config.value.palm_api_key
                  palm_api_key_plaintext = palm_config.value.palm_api_key_plaintext
                }
              }
              provider = external_model.value.provider
              task     = external_model.value.task
            }
          }
          instance_profile_arn        = served_entities.value.instance_profile_arn
          max_provisioned_concurrency = served_entities.value.max_provisioned_concurrency
          max_provisioned_throughput  = served_entities.value.max_provisioned_throughput
          min_provisioned_concurrency = served_entities.value.min_provisioned_concurrency
          min_provisioned_throughput  = served_entities.value.min_provisioned_throughput
          name                        = served_entities.value.name
          provisioned_model_units     = served_entities.value.provisioned_model_units
          scale_to_zero_enabled       = served_entities.value.scale_to_zero_enabled
          workload_size               = served_entities.value.workload_size
          workload_type               = served_entities.value.workload_type
        }
      }
      dynamic "served_models" {
        for_each = config.value.served_models != null ? config.value.served_models : []
        content {
          burst_scaling_enabled       = served_models.value.burst_scaling_enabled
          environment_vars            = served_models.value.environment_vars
          instance_profile_arn        = served_models.value.instance_profile_arn
          max_provisioned_concurrency = served_models.value.max_provisioned_concurrency
          max_provisioned_throughput  = served_models.value.max_provisioned_throughput
          min_provisioned_concurrency = served_models.value.min_provisioned_concurrency
          min_provisioned_throughput  = served_models.value.min_provisioned_throughput
          model_name                  = served_models.value.model_name
          model_version               = served_models.value.model_version
          name                        = served_models.value.name
          provisioned_model_units     = served_models.value.provisioned_model_units
          scale_to_zero_enabled       = served_models.value.scale_to_zero_enabled
          workload_size               = served_models.value.workload_size
          workload_type               = served_models.value.workload_type
        }
      }
      dynamic "traffic_config" {
        for_each = config.value.traffic_config != null ? [config.value.traffic_config] : []
        content {
          dynamic "routes" {
            for_each = traffic_config.value.routes != null ? traffic_config.value.routes : []
            content {
              served_entity_name = routes.value.served_entity_name
              served_model_name  = routes.value.served_model_name
              traffic_percentage = routes.value.traffic_percentage
            }
          }
        }
      }
    }
  }

  dynamic "email_notifications" {
    for_each = each.value.email_notifications != null ? [each.value.email_notifications] : []
    content {
      on_update_failure = email_notifications.value.on_update_failure
      on_update_success = email_notifications.value.on_update_success
    }
  }

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }

  dynamic "rate_limits" {
    for_each = each.value.rate_limits != null ? each.value.rate_limits : []
    content {
      calls          = rate_limits.value.calls
      key            = rate_limits.value.key
      renewal_period = rate_limits.value.renewal_period
    }
  }

  dynamic "tags" {
    for_each = each.value.tags != null ? each.value.tags : []
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

  dynamic "telemetry_config" {
    for_each = each.value.telemetry_config != null ? [each.value.telemetry_config] : []
    content {
      enabled_telemetry_features = telemetry_config.value.enabled_telemetry_features
      dynamic "inference_table_config" {
        for_each = telemetry_config.value.inference_table_config != null ? [telemetry_config.value.inference_table_config] : []
        content {
          name              = inference_table_config.value.name
          sampling_fraction = inference_table_config.value.sampling_fraction
        }
      }
      dynamic "table_names" {
        for_each = telemetry_config.value.table_names != null ? [telemetry_config.value.table_names] : []
        content {
          annotations_table = table_names.value.annotations_table
          logs_table        = table_names.value.logs_table
          metrics_table     = table_names.value.metrics_table
          traces_table      = table_names.value.traces_table
        }
      }
      telemetry_profile_id = telemetry_config.value.telemetry_profile_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      update = timeouts.value.update
    }
  }
}

