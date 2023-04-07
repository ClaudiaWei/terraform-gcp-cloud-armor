resource "google_compute_security_policy" "policy" {
  project     = var.project
  name        = "dev-access"

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
    for_each = var.dev_rule
    content{
      description = rule.value.description
      action = rule.value.action
      priority = rule.value.priority
      preview = rule.value.preview
      match{
        expr{
          expression = rule.value.expression
        }
      }
    }
  }
}
