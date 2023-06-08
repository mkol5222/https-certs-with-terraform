resource "local_file" "private_key" {
    for_each = acme_certificate.certificate
    content  = acme_certificate.certificate[each.key].private_key_pem
    filename = "./certs/private_key.pem"
}