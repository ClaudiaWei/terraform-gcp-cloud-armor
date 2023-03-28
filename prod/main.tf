resource "google_compute_security_policy" "policy" {
  project     = var.project
  name        = "prod-access"

  dynamic "rule"{
    for_each = var.default_rule
    content{
      description = rule.value.description
      action = rule.value.action
      priority = rule.value.priority
      match{
        versioned_expr = rule.value.versioned_expr
        config{
          src_ip_ranges = rule.value.src_ip_ranges
        }
      }
    }
  }

  dynamic "rule"{
    for_each = var.prod_rule
    content{
      description = rule.value.description
      action = rule.value.action
      priority = rule.value.priority
      match{
        versioned_expr = rule.value.versioned_expr
        config{
          src_ip_ranges = rule.value.src_ip_ranges
        }
      }
      rate_limit_options {
          conform_action = "allow"
          exceed_action = rule.value.exceed_action
          enforce_on_key = rule.value.enforce_on_key
          rate_limit_threshold {
              count = 600
              interval_sec = 60
          }
      }
    }
  }
}