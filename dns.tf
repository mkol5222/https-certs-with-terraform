# Purpose: Create DNS records in Cloudflare based on hosts.csv file

resource "cloudflare_record" "dnsrec" {
  for_each = { for host in local.hosts : host.host => host }

  zone_id = var.cloudflare_zone_id
  name    = each.value.host
  value   = each.value.IP
  type    = "A"
  ttl     = 3600
}


