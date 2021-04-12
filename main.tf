terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.63.0"
    }
  }
}

provider "google" {

  credentials = file("./keys/ahmad-terraform-fdc69cecb440.json")

  project = "ahmad-terraform"
  region  = "us-central1"
  zone    = "us-central1-c"
}

data "template_file" "add_ssh_keys" {
  template = file("./scripts/add-ssh-web-app.yaml")
  vars = {
    public_ssh_keys_list : jsonencode(var.public_ssh_keys_list)
  }
}

resource "google_compute_network" "vpc_network_one" {
  name = "terraform-network1"
}

resource "google_compute_instance" "vm_instance_one" {
  name         = "terraform-instance1"
  machine_type = "e2-standard-2"
  tags         = ["managment", "jenkins"]


  # provisioner "local-exec" {
  #   command = "echo ${google_compute_instance.vm_instance_one.name}:  ${google_compute_instance.vm_instance_one.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  # }

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-lts"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network_one.name
    access_config {
      nat_ip = google_compute_address.jenkins_static_ip.address
    }
  }

  metadata = {
    user-data = data.template_file.add_ssh_keys.rendered
  }
}

resource "google_compute_address" "jenkins_static_ip" {
  name = "jenkins-static-ip"
}
