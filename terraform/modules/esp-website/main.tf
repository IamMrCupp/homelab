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
    config_path     = "${var.k8s_config_path}"
    config_context  = "${var.k8s_config_context}"
}

resource "kubernetes_namespace" "esp-website_k8s_namespace" {
    metadata {
        name = "${var.k8s_namespace}"
    }
}

resource "kubernetes_deployment" "eps-website_deployment" {
    metadata {
        name        = "${var.k8s_namespace}"
        namespace   = kubernetes_namespace.test.metadata.0.name
    }
    spec {
        replicas = 2
        selector {
            match_labels = {
                app = EmotionalSupportPizza
            }
        }
        template {
            metadata {
                labels {
                    app = EmotionalSupportPizza
                }
            }
            spec {
                container {
                    image   = "iammrcupp/esp_project:v2.0.0"
                    name    = "ESPwebsite"
                    port {
                        container_port = 80
                    }
                    resources {
                        limits {
                            cpu     = "0.5"
                            memory  = "512Mi"
                        }
                        requests {
                            cpu     = "250m"
                            memory  = "50Mi"
                        }
                    }
                }
            }
        }
    }
}