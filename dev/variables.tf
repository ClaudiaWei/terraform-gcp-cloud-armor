variable "project" {
  type        = string
  description = "GCP project"
  default     = "claudia-development"
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
  description = "Dev env rule"
  default = {
    def_rule = {
      action = "deny(403)"
      priority = "2147483647"
      versioned_expr = "SRC_IPS_V1"
      src_ip_ranges = ["*"]
      description = "Default rule, higher priority overrides it"
    }
  }
  type = map(object({
    action        = string
    priority      = string
    versioned_expr = string
    src_ip_ranges = list(string)
    description   = string
    })
  )
}

variable "dev_rule" {
  description = "dev env rule"
  default = {
    region_rule = {
      action        = "allow"
      priority      = "102"
      description   = "allow TW, HK, JP region"
      expression    = "origin.region_code == 'TW' || origin.region_code == 'HK' || origin.region_code == 'JP'"
      preview = true
    }
  }
  type = map(object({
    action        = string
    priority      = string
    description   = string
    expression    = string
    preview = bool
    })
  )
}
