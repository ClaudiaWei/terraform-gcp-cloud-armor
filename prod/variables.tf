variable "project" {
  type        = string
  description = "GCP project"
  default     = "claudia-production"
}

variable "region" {
  type        = string
  description = "Project region"
  default     = "us-west1"
}

variable "zone" {
  type        = string
  description = "Project zone"
  default     = "us-west1-b"
}

variable "default_rule" {
  description = "Prod env rule"
  default = {
    def_rule = {
      description = "Default rule, higher priority overrides it"
      action = "deny(403)"
      priority = "2147483647"
      versioned_expr = "SRC_IPS_V1"
      src_ip_ranges = ["*"]
    }
  }
  type = map(object({
    description   = string
    action        = string
    priority      = string
    versioned_expr = string
    src_ip_ranges = list(string)
    })
  )
}

variable "prod_rule" {
  description = "prod env rule"
  default = {
    traffic_rule = {
      description = "throttle with 1 min 600 requests"
      action      = "throttle"
      priority    = "100"
      versioned_expr = "SRC_IPS_V1"
      src_ip_ranges = ["*"]
      exceed_action = "deny(429)"
      enforce_on_key = "IP"
      preview = true
    }
  }
  type = map(object({
    description   = string
    action        = string
    priority      = string
    versioned_expr = string
    src_ip_ranges = list(string)
    exceed_action = string
    enforce_on_key = string
    })
  )
}
