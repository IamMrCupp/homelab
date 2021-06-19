# file: modules/dns/tech-noid.net/external/main.tf
# - controls the domain names in DNS at namecheap.com
# - domain: tech-noid.net

# import the providers from parent dir(s)
import "providers" {
  config_path = find_in_parent_folders("providers.tf")
}


# gmail CNAME for email
resource "namecheap_record" "cname-mail-tech-noid-net" {
  name = "mail"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "tech-noid.net"
} 

# Create a DNS A Record for a domain you own
resource "namecheap_record" "cname-bitly-tech-noid-net" {
  name = "226ceff29825"  
  address = "cname.bitly.com."
  type = "CNAME"
  ttl = 60
  domain = "tech-noid.net"
} 

