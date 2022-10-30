terraform {
    required_version = "1.2.8"
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
