/*
    file: apps/emotionalsupportpizza/website/variables.tf
        - variables for use in terraform
*/

variable "k8s_config_path" {
    type        = string
    description = "The path to local kubectl config file to use for connection to k8s cluster."
}

variable "k8s_config_context" {
    type        = string
    description = "The context to use from the k8s/kubectl file for connecting to the k8s cluster."
}

variable "k8s_namespace" {
    type        = string
    description = "The namespace to use for this deployment; this will be created if needed."
}