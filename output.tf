
# all A records
output "hosts" {
  value = cloudflare_record.dnsrec
}

# all certificates obtained
output "certificates" {
  value     = acme_certificate.certificate
  sensitive = true
}