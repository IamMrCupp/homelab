# file: dns/tech-noid.net/external/main.tf
# - controls the domain names in DNS at namecheap.com
# - domain: tech-noid.net

terraform {
  required_providers {
    namecheap = {
      source  = "robgmills/namecheap"
      version = "1.7.0"
    }
  }
}

provider "namecheap" {
  username = "disfigure"          # Also set by env variable `NAMECHEAP_USERNAME`
  api_user = "disfigure"          # Same as username; also set by env variable `NAMECHEAP_API_USER`
  token = "your_token"            # Also set by env variable `NAMECHEAP_TOKEN`
  ip = "your.ip.address.here"    # Also set by env variable `NAMECHEAP_IP`
  use_sandbox = true              # Toggle for testing/sandbox mode; Also set by env variable `NAMECHEAP_USE_SANDBOX`
}

# gmail CNAME for email
resource "namecheap_record" "cname-mail-tech-noid-net" {
  name = "mail"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "tech-noid.net"
} 

# cname.bitly.com for tech-noid.net domain
resource "namecheap_record" "cname-bitly-tech-noid-net" {
  name = "226ceff29825"  
  address = "cname.bitly.com."
  type = "CNAME"
  ttl = 60
  domain = "tech-noid.net"
} 

