variable "project" {
  type = string
  default = "challenge-01-367100"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "account_id" {
  type = string
  default = "svc-challenge"
}

variable "vnet_name" {
  type = string
  default = "default"
}

variable "gke_location" {
  type = string
  default = "us-central1-a"
}

variable "machine_type" {
    type = string
    default = "e2-standard-2"
}

variable "disk_type" {
    type = string
    default = "pd-standard"
}

variable "disk_size_gb" {
  type = number
  default = 10
}

variable "format" {
  type = string
  default = "DOCKER"
}
variable "master_ipv4_cidr_block" {
  type        = string
  default     = ""
}