variable "model_servings" {
  description = <<EOT
Map of model_servings, attributes below
Required:
    - name
Optional:
    - budget_policy_id
    - description
    - route_optimized
    - ai_gateway (block):
        - fallback_config (optional, block):
            - enabled (required)
        - guardrails (optional, block):
            - input (optional, block):
                - invalid_keywords (optional)
                - pii (optional, block):
                    - behavior (optional)
                - safety (optional)
                - valid_topics (optional)
            - output (optional, block):
                - invalid_keywords (optional)
                - pii (optional, block):
                    - behavior (optional)
                - safety (optional)
                - valid_topics (optional)
        - inference_table_config (optional, block):
            - catalog_name (optional)
            - enabled (optional)
            - schema_name (optional)
            - table_name_prefix (optional)
        - rate_limits (optional, block):
            - calls (optional)
            - key (optional)
            - principal (optional)
            - renewal_period (required)
            - tokens (optional)
        - usage_tracking_config (optional, block):
            - enabled (optional)
    - config (block):
        - auto_capture_config (optional, block):
            - catalog_name (optional)
            - enabled (optional)
            - schema_name (optional)
            - table_name_prefix (optional)
        - served_entities (optional, block):
            - burst_scaling_enabled (optional)
            - entity_name (optional)
            - entity_version (optional)
            - environment_vars (optional)
            - external_model (optional, block):
                - ai21labs_config (optional, block):
                    - ai21labs_api_key (optional)
                    - ai21labs_api_key_plaintext (optional)
                - amazon_bedrock_config (optional, block):
                    - aws_access_key_id (optional)
                    - aws_access_key_id_plaintext (optional)
                    - aws_region (required)
                    - aws_secret_access_key (optional)
                    - aws_secret_access_key_plaintext (optional)
                    - bedrock_provider (required)
                    - instance_profile_arn (optional)
                    - uc_service_credential_name (optional)
                - anthropic_config (optional, block):
                    - anthropic_api_key (optional)
                    - anthropic_api_key_plaintext (optional)
                - cohere_config (optional, block):
                    - cohere_api_base (optional)
                    - cohere_api_key (optional)
                    - cohere_api_key_plaintext (optional)
                - custom_provider_config (optional, block):
                    - api_key_auth (optional, block):
                        - key (required)
                        - value (optional)
                        - value_plaintext (optional)
                    - bearer_token_auth (optional, block):
                        - token (optional)
                        - token_plaintext (optional)
                    - custom_provider_url (required)
                - databricks_model_serving_config (optional, block):
                    - databricks_api_token (optional)
                    - databricks_api_token_plaintext (optional)
                    - databricks_workspace_url (required)
                - google_cloud_vertex_ai_config (optional, block):
                    - private_key (optional)
                    - private_key_plaintext (optional)
                    - project_id (required)
                    - region (required)
                - name (required)
                - openai_config (optional, block):
                    - microsoft_entra_client_id (optional)
                    - microsoft_entra_client_secret (optional)
                    - microsoft_entra_client_secret_plaintext (optional)
                    - microsoft_entra_tenant_id (optional)
                    - openai_api_base (optional)
                    - openai_api_key (optional)
                    - openai_api_key_plaintext (optional)
                    - openai_api_type (optional)
                    - openai_api_version (optional)
                    - openai_deployment_name (optional)
                    - openai_organization (optional)
                - palm_config (optional, block):
                    - palm_api_key (optional)
                    - palm_api_key_plaintext (optional)
                - provider (required)
                - task (required)
            - instance_profile_arn (optional)
            - max_provisioned_concurrency (optional)
            - max_provisioned_throughput (optional)
            - min_provisioned_concurrency (optional)
            - min_provisioned_throughput (optional)
            - name (optional)
            - provisioned_model_units (optional)
            - scale_to_zero_enabled (optional)
            - workload_size (optional)
            - workload_type (optional)
        - served_models (optional, block):
            - burst_scaling_enabled (optional)
            - environment_vars (optional)
            - instance_profile_arn (optional)
            - max_provisioned_concurrency (optional)
            - max_provisioned_throughput (optional)
            - min_provisioned_concurrency (optional)
            - min_provisioned_throughput (optional)
            - model_name (required)
            - model_version (required)
            - name (optional)
            - provisioned_model_units (optional)
            - scale_to_zero_enabled (optional)
            - workload_size (optional)
            - workload_type (optional)
        - traffic_config (optional, block):
            - routes (optional, block):
                - served_entity_name (optional)
                - served_model_name (optional)
                - traffic_percentage (required)
    - email_notifications (block):
        - on_update_failure (optional)
        - on_update_success (optional)
    - provider_config (block):
        - workspace_id (optional)
    - rate_limits (block):
        - calls (required)
        - key (optional)
        - renewal_period (required)
    - tags (block):
        - key (required)
        - value (optional)
    - telemetry_config (block):
        - enabled_telemetry_features (optional)
        - inference_table_config (optional, block):
            - name (optional)
            - sampling_fraction (optional)
        - table_names (optional, block):
            - annotations_table (optional)
            - logs_table (optional)
            - metrics_table (optional)
            - traces_table (optional)
        - telemetry_profile_id (optional)
    - timeouts (block):
        - create (optional)
        - update (optional)
EOT

  type = map(object({
    name             = string
    budget_policy_id = optional(string)
    description      = optional(string)
    route_optimized  = optional(bool)
    ai_gateway = optional(object({
      fallback_config = optional(object({
        enabled = bool
      }))
      guardrails = optional(object({
        input = optional(object({
          invalid_keywords = optional(list(string))
          pii = optional(object({
            behavior = optional(string)
          }))
          safety       = optional(bool)
          valid_topics = optional(list(string))
        }))
        output = optional(object({
          invalid_keywords = optional(list(string))
          pii = optional(object({
            behavior = optional(string)
          }))
          safety       = optional(bool)
          valid_topics = optional(list(string))
        }))
      }))
      inference_table_config = optional(object({
        catalog_name      = optional(string)
        enabled           = optional(bool)
        schema_name       = optional(string)
        table_name_prefix = optional(string)
      }))
      rate_limits = optional(list(object({
        calls          = optional(number)
        key            = optional(string)
        principal      = optional(string)
        renewal_period = string
        tokens         = optional(number)
      })))
      usage_tracking_config = optional(object({
        enabled = optional(bool)
      }))
    }))
    config = optional(object({
      auto_capture_config = optional(object({
        catalog_name      = optional(string)
        enabled           = optional(bool)
        schema_name       = optional(string)
        table_name_prefix = optional(string)
      }))
      served_entities = optional(list(object({
        burst_scaling_enabled = optional(bool)
        entity_name           = optional(string)
        entity_version        = optional(string)
        environment_vars      = optional(map(string))
        external_model = optional(object({
          ai21labs_config = optional(object({
            ai21labs_api_key           = optional(string)
            ai21labs_api_key_plaintext = optional(string)
          }))
          amazon_bedrock_config = optional(object({
            aws_access_key_id               = optional(string)
            aws_access_key_id_plaintext     = optional(string)
            aws_region                      = string
            aws_secret_access_key           = optional(string)
            aws_secret_access_key_plaintext = optional(string)
            bedrock_provider                = string
            instance_profile_arn            = optional(string)
            uc_service_credential_name      = optional(string)
          }))
          anthropic_config = optional(object({
            anthropic_api_key           = optional(string)
            anthropic_api_key_plaintext = optional(string)
          }))
          cohere_config = optional(object({
            cohere_api_base          = optional(string)
            cohere_api_key           = optional(string)
            cohere_api_key_plaintext = optional(string)
          }))
          custom_provider_config = optional(object({
            api_key_auth = optional(object({
              key             = string
              value           = optional(string)
              value_plaintext = optional(string)
            }))
            bearer_token_auth = optional(object({
              token           = optional(string)
              token_plaintext = optional(string)
            }))
            custom_provider_url = string
          }))
          databricks_model_serving_config = optional(object({
            databricks_api_token           = optional(string)
            databricks_api_token_plaintext = optional(string)
            databricks_workspace_url       = string
          }))
          google_cloud_vertex_ai_config = optional(object({
            private_key           = optional(string)
            private_key_plaintext = optional(string)
            project_id            = string
            region                = string
          }))
          name = string
          openai_config = optional(object({
            microsoft_entra_client_id               = optional(string)
            microsoft_entra_client_secret           = optional(string)
            microsoft_entra_client_secret_plaintext = optional(string)
            microsoft_entra_tenant_id               = optional(string)
            openai_api_base                         = optional(string)
            openai_api_key                          = optional(string)
            openai_api_key_plaintext                = optional(string)
            openai_api_type                         = optional(string)
            openai_api_version                      = optional(string)
            openai_deployment_name                  = optional(string)
            openai_organization                     = optional(string)
          }))
          palm_config = optional(object({
            palm_api_key           = optional(string)
            palm_api_key_plaintext = optional(string)
          }))
          provider = string
          task     = string
        }))
        instance_profile_arn        = optional(string)
        max_provisioned_concurrency = optional(number)
        max_provisioned_throughput  = optional(number)
        min_provisioned_concurrency = optional(number)
        min_provisioned_throughput  = optional(number)
        name                        = optional(string)
        provisioned_model_units     = optional(number)
        scale_to_zero_enabled       = optional(bool)
        workload_size               = optional(string)
        workload_type               = optional(string)
      })))
      served_models = optional(list(object({
        burst_scaling_enabled       = optional(bool)
        environment_vars            = optional(map(string))
        instance_profile_arn        = optional(string)
        max_provisioned_concurrency = optional(number)
        max_provisioned_throughput  = optional(number)
        min_provisioned_concurrency = optional(number)
        min_provisioned_throughput  = optional(number)
        model_name                  = string
        model_version               = string
        name                        = optional(string)
        provisioned_model_units     = optional(number)
        scale_to_zero_enabled       = optional(bool)
        workload_size               = optional(string)
        workload_type               = optional(string)
      })))
      traffic_config = optional(object({
        routes = optional(list(object({
          served_entity_name = optional(string)
          served_model_name  = optional(string)
          traffic_percentage = number
        })))
      }))
    }))
    email_notifications = optional(object({
      on_update_failure = optional(list(string))
      on_update_success = optional(list(string))
    }))
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
    rate_limits = optional(list(object({
      calls          = number
      key            = optional(string)
      renewal_period = string
    })))
    tags = optional(list(object({
      key   = string
      value = optional(string)
    })))
    telemetry_config = optional(object({
      enabled_telemetry_features = optional(list(string))
      inference_table_config = optional(object({
        name              = optional(string)
        sampling_fraction = optional(number)
      }))
      table_names = optional(object({
        annotations_table = optional(string)
        logs_table        = optional(string)
        metrics_table     = optional(string)
        traces_table      = optional(string)
      }))
      telemetry_profile_id = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
    }))
  }))
}

