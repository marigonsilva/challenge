terraform {
    required_version = "1.3.3"
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "4.33.0"
        }
        google-beta = {
            source  = "hashicorp/google-beta"
        }
    }
}

locals {
  env = "dev"
}

provider "google" {
# Configuration options
    project     = var.project
    region      = var.region
    #credentials = terraform.workspace
}

provider "google-beta" {
# Configuration options
    project     = var.project
    region      = var.region
}

data "google_service_account" "svc" {
    account_id = var.account_id
}

data "google_compute_network" "vnet" {
    name = var.vnet_name
}

resource "google_container_cluster" "gke_cluster" {
    provider           = google-beta
    name               = "gke-${local.env}-challenge"
    location           = var.gke_location
    network            =  data.google_compute_network.vnet.name
    node_pool {
        node_config {
            machine_type    =  var.machine_type
            disk_type       =  var.disk_type
            disk_size_gb    =  10
            image_type      =  "ubuntu_containerd"
            service_account =  data.google_service_account.svc.email
            oauth_scopes    = [
                "https://www.googleapis.com/auth/cloud-platform"
            ]
            labels = {
                project = "challenge-01"
            }
        }  
        autoscaling {
            max_node_count = 4
            min_node_count = 2
        }

        management {
            auto_repair  = true
            auto_upgrade = true
        }  
    }
    addons_config {
        horizontal_pod_autoscaling {
            disabled = false
        }

        http_load_balancing {
            disabled = false
        }
    }
    timeouts {
        create = "60m"
        update = "60m"
    }

    cluster_telemetry {
        type = "ENABLED"
    }
}

resource "google_artifact_registry_repository" "registry" {
    project       = var.project
    location      = var.region
    format        = var.format
    repository_id = "repo"
}
