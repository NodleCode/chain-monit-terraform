#test5

terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.63.0"
    }
  }

  backend "gcs" {
    ## cant use vars here
    bucket = "ahmad-tf-state"
    prefix = "terraform/state"
  }

}

provider "google" {
  credentials = var.GOOGLE_BACKEND_CREDENTIALS
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_compute_project_metadata" "default_project_metadata" {
  metadata = {
    ssh-keys = join("\n", [for user, key in var.public_ssh_keys_map : "${user}:${key}"])
  }
}

module "vpc" {
  source = "./modules/vpc"
}

module "jenkins" {
  source   = "./modules/jenkins"
  vpc_name = module.vpc.vpc_network_zero.name
}

module "chain" {
  source         = "./modules/chain"
  vpc_name       = module.vpc.vpc_network_zero.name
  startup_script = file("./scripts/chain_startup.sh")
}

