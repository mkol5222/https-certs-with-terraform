# HTTPS certificates with Terraform and Cloudflare DNS

### Requirements

- DNS zone in Cloudflare DNS with API token with zone EDIT permissions

### Inputs

- TF variables in following table

| Variable | Description | Notes |
| ------------- | ------------- | -- |
| cloudflare_api_token  | Cloudflare API token with permissions EDIT for your zone  | sensitive  |
| cloudflare_domain  | certificates are created for (host.csv) host in this domain  | e.g. klaud.online |
| cloudflare_zone_id  | Content Cell  | zone ID from Cloudflare DNS |
| acme_email  | your e-mail used for ACME API access to Let's Encrypt  |  |
| acme_staging | | bool - should use Let's Encrypt [staging](https://letsencrypt.org/docs/staging-environment/) instead of production?  |

- hosts.csv with columns "host,IP", example:
```
host,IP
web,100.10.20.30
api,192.168.1.99
```

### Outputs
- `hosts` documenting all A records added
- `certificates` your certificates that can be saved to disk with `./scripts/save-certs.ps1`

## Usage
- copy terrafrom.tfvars.example to terrafrom.tfvars and fill in the variables
- add your hosts to hosts.csv with name under your domain and IP address
- run `terraform init`
- run `terraform plan` to review what will be done
- run `terraform apply`
- certificates are now saved by Terraform to `./certs`
- optional: save certificates from terraform to disk in Powershell using `./scripts/save-certs.ps1`
- at the end you can run `terraform destroy` to remove the certificates and host A records, if needed
- you can inspect certificate with `openssl x509 -in <cert> -text -noout` - e.g.  `openssl x509 -in ./certificates/test-web.pem -text -noout`