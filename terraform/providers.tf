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
  #ip = "your.ip.address.here"    # Also set by env variable `NAMECHEAP_IP`
  use_sandbox = true              # Toggle for testing/sandbox mode; Also set by env variable `NAMECHEAP_USE_SANDBOX`
}