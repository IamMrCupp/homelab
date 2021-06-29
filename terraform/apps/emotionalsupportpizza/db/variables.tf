/*
    file: apps/emotionalsupportpizza/db/variables.tf
        - variables for use in terraform
*/

variable "k8s_config_path" {
    type        = string
    description = "The path to local kubectl config file to use for connection to k8s cluster."
    default     = "~/.kube/config"
}

variable "k8s_config_context" {
    type        = string
    description = "The context to use from the k8s/kubectl file for connecting to the k8s cluster."
    default     = "rpi-k8s"
}