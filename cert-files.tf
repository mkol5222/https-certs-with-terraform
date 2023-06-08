resource "local_file" "private_key" {
    for_each = acme_certificate.certificate
    content  = acme_certificate.certificate[each.key].private_key_pem
    filename = "./certs/${each.key}.key"
}

resource "local_file" "certificate" {
    for_each = acme_certificate.certificate
    content  = acme_certificate.certificate[each.key].certificate_pem
    filename = "./certs/${each.key}.pem"
}