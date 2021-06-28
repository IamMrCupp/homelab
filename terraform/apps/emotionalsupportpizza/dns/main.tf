/*
  file: apps/emotionalsupportpizza/dns/main.tf

  Emotional Support Pizza DNS
  -  All the work is actually done in the module not this file
*/

# pull in the module for the DNS changes
module "emotionalsupportpizza-namecheap-dns" {
  source      = "../../../modules/dns-namecheap/emotionalsupportpizza/"

  username    = "disfigure"       # Also set by env variable `NAMECHEAP_USERNAME`
  api_user    = "disfigure"       # Same as username; also set by env variable `NAMECHEAP_API_USER`
  token       = ""                # Also set by env variable `NAMECHEAP_TOKEN`
  ip_address  = "var.ip_address"  # Also set by env variable `NAMECHEAP_IP`
  sandbox     = true              # Toggle for testing/sandbox mode; Also set by env variable `NAMECHEAP_USE_SANDBOX`
}