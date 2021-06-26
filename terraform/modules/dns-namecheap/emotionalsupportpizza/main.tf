/* 
    file: modules/dns-namecheap/emotionalsupportpizza.com/main.tf
    - controls the domain names in DNS at namecheap.com
    - domain: emotionalsupportpizza.com
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
  username = "disfigure"          # Also set by env variable `NAMECHEAP_USERNAME`
  api_user = "disfigure"          # Same as username; also set by env variable `NAMECHEAP_API_USER`
  token = "your_token"            # Also set by env variable `NAMECHEAP_TOKEN`
  ip = "your.ip.address.here"    # Also set by env variable `NAMECHEAP_IP`
  use_sandbox = true              # Toggle for testing/sandbox mode; Also set by env variable `NAMECHEAP_USE_SANDBOX`
}


/* 
  *  DNS Entries 

  ?  Use the following framework for the entries: 
    resource "namecheap_record" "[TYPE]-[DESCRIPTIVE-NAME]-emotionalsupportpizza" {
        name = ""  
        address = ""
        type = ""
        ttl = 60
        domain = "emotionalsupportpizza.com"
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
resource "namecheap_record" "cname-calendar-emotionalsupportpizza" {
  name = "calendar"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "emotionalsupportpizza.com"
} 

resource "namecheap_record" "cname-drive-emotionalsupportpizza" {
  name = "drive"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "emotionalsupportpizza.com"
} 

resource "namecheap_record" "cname-group-emotionalsupportpizza" {
  name = "group"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "emotionalsupportpizza.com"
} 

resource "namecheap_record" "cname-mail-emotionalsupportpizza" {
  name = "mail"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "emotionalsupportpizza.com"
} 

resource "namecheap_record" "cname-sites-emotionalsupportpizza" {
  name = "sites"  
  address = "ghs.google.com."
  type = "CNAME"
  ttl = 60
  domain = "emotionalsupportpizza.com"
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
resource "namecheap_record" "txt-google-domainverif-emotionalsupportpizza" {
  name = "@"  
  address = "google-site-verification=1XfM_2FP9-KN8cAzgvLVozrYvaZMorO-q2VG00JOWus"
  type = "TXT"
  ttl = 60
  domain = "emotionalsupportpizza.com"
} 

# facebook domain verification record
resource "namecheap_record" "txt-facebook-domainverif-emotionalsupportpizza" {
  name = "@"  
  address = "facebook-domain-verification=nt55039o5mn6ger73hkkxgybuuwzfd"
  type = "TXT"
  ttl = 60
  domain = "emotionalsupportpizza.com"
} 

# microsoft365 domain verification record
resource "namecheap_record" "txt-m365-domainverif-emotionalsupportpizza" {
  name = "@"  
  address = "MS=ms80076789"
  type = "TXT"
  ttl = 60
  domain = "emotionalsupportpizza.com"
} 
# domain keys for email at google
resource "namecheap_record" "txt-google-domainkey-emotionalsupportpizza" {
  name = "google._domainkey"  
  address = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmXrwQQV4YRMKfC4Fj4BqYgvn72PN7zrMmoo4o/9xStp7NSh/91jtEp1gZ4Bk+43i8wsqAix+PRyaxxi0Y85hkkyJEKoYicKUSNFTF+Z2eBhr8vkL7apy0bTgkcCLApu+WEf6c7pe3S5mDmABijzzjAKRqpLnu+d+CmAFLkGOK2D8tUDhthoc8YyDjfEs6n+bjPHPMycQvMqEDodJg7l1RUFQEK8F/TluRHNRgbXGBP+8OaYXW5cljqrK+t3Sz7/FSOpFuyfD3aU7//gfGZDwPjr1TgMrBvKWfpub4FOBfzyPAfOuSsBAUR07WB5QBA0ZKn8i5vfxrNqc6FBwPh136QIDAQAB"
  type = "TXT"
  ttl = 60
  domain = "emotionalsupportpizza.com"
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