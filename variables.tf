
variable "cloudflare_api_token" {
  description = "value of Cloudflare API token"
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "value of Cloudflare zone ID"
}

variable "cloudflare_domain" {
  description = "value of Cloudflare domain"
}

variable "acme_email" {
  description = "value of ACME email"
}
 
 variable "acme_staging" {
  type        = bool
  description = "generate certificates in Let's Encrypt staging environment instead of production"
}
 