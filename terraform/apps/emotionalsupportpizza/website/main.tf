/*
    file: apps/emotionalsupportpizza/website/main.tf

    Emotional Support Pizza Website
*/

# pull in the module for the DNS changes
module "emotionalsupportpizza-default-website" {
    source      = "../../../modules/esp-website/"

    k8s_config_path     = "~/.kube/config"
    k8s_config_context  = "rpi-k8s"

    k8s_namespace = "emotional-support-pizza"
}