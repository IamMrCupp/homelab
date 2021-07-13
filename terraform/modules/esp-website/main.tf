/*
    file: modules/eps-website/main.tf

*/

terraform {
    required_providers {
        kubernetes = {
            source  = "hashicorp/kubernetes"
            version = ">= 2.0.0"
        }
    }
}

provider "kubernetes" {
    config_path = "${var.k8s_config_path}"
    config_context = "${var.k8s_config_context}"
}

resource "kubernetes_namespace" "esp-website_k8s_namespace" {
    metadata {
        name = "${var.k8s_namespace}"
    }
}