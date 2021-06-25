/* 
    file: modules/dns-namecheap/tech-noid-net/main.tf
    - controls the domain names in DNS at namecheap.com
    - domain: tech-noid.net
*/

/* 
    Configure the providers and such that are in use in the module
*/
terraform {
  required_providers {
    namecheap = {
      source  = "robgmills/namecheap"
      version = "1.7.0"
    }
  }
}

provider "namecheap" {
  username = var.username     # Also set by env variable `NAMECHEAP_USERNAME`
  api_user = var.api_user     # Same as username; also set by env variable `NAMECHEAP_API_USER`
  token = var.token           # Also set by env variable `NAMECHEAP_TOKEN`
  ip = var.ip_address         # Also set by env variable `NAMECHEAP_IP`
  use_sandbox = var.sandbox   # Toggle for testing/sandbox mode; Also set by env variable `NAMECHEAP_USE_SANDBOX`
}


/* 
  *  DNS Entries 

  ?  Use the following framework for the entries: 
    resource "namecheap_record" "[TYPE]-[DESCRIPTIVE-NAME]-tech-noid" {
        name = ""  
        address = ""
        type = ""
        ttl = 60
        domain = "tech-noid.net"
    } 
*/

/*
    A RECORDS
*/

/*  
    AAAA RECORDS
*/

/*
    ALIAS RECORDS
*/

/*
    CAA RECORDS
*/

/*
    CNAMES RECORDS
*/
resource "namecheap_record" "cname-calendar-tech-noid" {
  name = "calendar"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "tech-noid.net"
} 

resource "namecheap_record" "cname-drive-tech-noid" {
  name = "drive"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "tech-noid.net"
} 

resource "namecheap_record" "cname-group-tech-noid" {
  name = "group"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "tech-noid.net"
} 

resource "namecheap_record" "cname-mail-tech-noid" {
  name = "mail"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "tech-noid.net"
} 

resource "namecheap_record" "cname-sites-tech-noid" {
  name = "sites"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "tech-noid.net"
} 

/*
    MX RECORDS
*/

/*
    MXE RECORDS
*/

/*
    NS RECORDS
*/

/*
    TXT RECORDS
*/
# google domain verification record
resource "namecheap_record" "txt-google-domainverif-tech-noid" {
  name = "@"  
  address = ""
  type = "TXT"
  ttl = 60
  domain = "tech-noid.net"
} 

# facebook domain verification record
resource "namecheap_record" "txt-facebook-domainverif-tech-noid" {
  name = "@"  
  address = ""
  type = "TXT"
  ttl = 60
  domain = "tech-noid.net"
} 

# domain keys for email at google
resource "namecheap_record" "txt-google-domainkey-tech-noid" {
  name = "google._domainkey"  
  address = ""
  type = "TXT"
  ttl = 60
  domain = "tech-noid.net"
} 

/*
    URL RECORDS
*/

/*
    URL301 RECORDS
*/

/*
    FRAME RECORDS
*/