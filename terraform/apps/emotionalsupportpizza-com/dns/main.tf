/*
  Emotional Support Pizza DNS
  -  All the work is actually done in the module not this file
*/

# pull in the module for the DNS changes
module "emotionalsupportpizza-namecheap-dns" {
  source = "../../../modules/dns-namecheap/emotionalsupportpizza-com/"
}