/* 
    file: terraform/apps/emotionalsupportpizza/db/main.tf

    - configure the Database Server for use with the website
    - domain: emotionalsupportpizza.com
*/

terraform {

    required_version = ">= 1.0.0"

    required_providers {}
}

provider "kubernetes-alpha" {
    config_path     = "${var.k8s_config_path}"
    config_context  = "${var.k8s_config_context}"
}

# setup a PVC in the k8s cluster for use with the ESP mysql pods
resource "kubernetes_manifest" "persistentvolumeclaim_mysql_db_persistent_storage_esp" {
    provider = kubernetes-alpha
    manifest = {
        "apiVersion" = "v1"
        "kind" = "PersistentVolumeClaim"
        "metadata" = {
            "labels" = {
                "app"   = "mysql"
                "site"  = "emotionalsupportpizza"
            }
            "name"      = "mysql-db-persistent-storage-esp"
            "namespace" = "emotionalsupportpizza"
        }
        "spec" = {
            "accessModes" = ["ReadWriteMany"]
            "resources" = {
                "requests" = {
                    "storage" = "5Gi"
                }
            }
            "storageClassName" = "nfs-client"
        }
    }
}

# create a service for mysql
resource "kubernetes_manifest" "service_esp_wordpress_mysql" {
    provider = kubernetes-alpha
    manifest = {
        "apiVersion" = "v1"
        "kind" = "Service"
        "metadata" = {
            "labels" = {
                "app" = "wordpress"
            }
            "name" = "esp-wordpress-mysql"
            "namespace" = "emotionalsupportpizza"
        }
        "spec" = {
            "clusterIP" = "None"
            "ports" = [
                {
                    "port" = 3306
                },
            ]
            "selector" = {
                "app" = "wordpress"
                "tier" = "mysql"
            }
        }
    }
}

# deploy the beast
resource "kubernetes_manifest" "deployment_esp_wordpress_mysql" {
    provider = kubernetes-alpha
    manifest = {
        "apiVersion" = "apps/v1"
        "kind" = "Deployment"
        "metadata" = {
            "labels" = {
                "app" = "wordpress"
            }
            "name" = "esp-wordpress-mysql"
            "namespace" = "emotionalsupportpizza"
        }
        "spec" = {
            "selector" = {
                "matchLabels" = {
                    "app" = "esp-wordpress"
                    "tier" = "mysql"
                }
            }
            "strategy" = {
                "type" = "Recreate"
            }
            "template" = {
                "metadata" = {
                    "labels" = {
                        "app" = "esp-wordpress"
                        "tier" = "mysql"
                    }
                }
                "spec" = {
                    "containers" = [
                        {
                            "env" = [
                                {
                                    "name" = "MYSQL_ROOT_PASSWORD"
                                    "valueFrom" = {
                                        "secretKeyRef" = {
                                            "key" = "password"
                                            "name" = "esp-mysql-pass"
                                        }
                                    }
                                },
                            ]
                            "image" = "mysql:5.6"
                            "name" = "esp-mysql"
                             "ports" = [
                                {
                                    "containerPort" = 3306
                                    "name" = "esp-mysql"
                                },
                            ]
                            "volumeMounts" = [
                                {
                                    "mountPath" = "/var/lib/mysql"
                                    "name" = "esp-mysql-persistent-storage"
                                },
                            ]
                        },
                    ]
                    "volumes" = [
                        {
                            "name" = "esp-mysql-persistent-storage"
                            "persistentVolumeClaim" = {
                                "claimName" = "mysql-db-persistent-storage-esp"
                            }
                        },
                    ]
                }
            }
        }
    }
}
