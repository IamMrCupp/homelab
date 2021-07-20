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
        name        = "ESPwebsite"
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

resource "kubernetes_service" "esp-website_service" {
    metadata {
        name        = "ESPwebsite"
        namespace   = kubernetes_namespace.esp-website_k8s_namespace.metadata.0.name
    }
    spec {
        selector = {
            app = kubernetes_deployment.eps-website_deployment.spec.0.template.0.metadata.0.labels.app
        }
        type = "NodePort"
        port {
            node_port   = 30201
            port        = 80
            target_port = 80
        }
    }
}