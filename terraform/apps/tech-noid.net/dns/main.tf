#  Tech-Noid System DNS
#   -  All the work is actually done in the module not this file

# pull in the module for the DNS changes
module "tech-noid-systems-namecheap-dns" {
  source = "../../../modules/dns-namecheap/tech-noid.net/"
}