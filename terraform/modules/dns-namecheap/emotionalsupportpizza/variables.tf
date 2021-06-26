/* 
    file: modules/dns-namecheap/emotionalsupportpizza/variables.tf
*/

variable "username" {
    type        = string
    description = "Namecheap username for access to things"
}

variable "api_user" {
    type        = string
    description = "Namecheap username for access to things (matches username typically)"
}

variable "token" {
    type        = string
    description = "Access Token to use for things"
}

variable "ip_address" {
    type        = string
    description = "IP address to use"
}

variable "sandbox" {
    type        = bool
    description = "Are we using the SANDBOX for testing?"
}