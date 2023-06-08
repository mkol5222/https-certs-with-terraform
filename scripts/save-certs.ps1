
# save certificates after terraform apply

Write-Host; Write-Host "DNS records added:"
(terraform output -json hosts | ConvertFrom-Json -AsHashtable).Keys

Write-Host; Write-Host "Saving certificates to ./certificates folder..."
$certs=(terraform output -json certificates | ConvertFrom-Json -AsHashtable)

foreach ($cert in $certs.GetEnumerator()) {
    $certPath = "./certificates/$($cert.Name).pem"
    $cert.Value.certificate_pem | Out-File $certPath -Encoding utf8
    Write-Host "Saved certificate to $certPath"

    $certKeyPath = "./certificates/$($cert.Name).key"
    $cert.Value.private_key_pem | Out-File $certKeyPath -Encoding utf8
    Write-Host "Saved certificate private key to $certKeyPath"
}
