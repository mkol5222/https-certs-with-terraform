# used for ACME registration
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.acme_email
}

# certificates based on hosts.csv file
resource "acme_certificate" "certificate" {
  for_each = { for host in local.hosts : host.host => host }

  account_key_pem = acme_registration.reg.account_key_pem


  common_name               = "${each.value.hostname}.${var.cloudflare_domain}"
  subject_alternative_names = ["${each.value.hostname}.${var.cloudflare_domain}"]

  dns_challenge {
    provider = "cloudflare"
  }
}
