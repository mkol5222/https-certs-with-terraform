# CSV file: hosts.csv with host,IP columns
locals {
  hosts = csvdecode(file("hosts.csv"))
}