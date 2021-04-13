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

resource "google_compute_project_metadata" "default_project_metadata" {
  metadata = {
    ssh-keys = join("\n", [for user, key in var.public_ssh_keys_map : "${user}:${key}"])
  }
}

# data "template_file" "add_ssh_keys" {
#   template = file("./scripts/add-ssh-web-app.yaml")
#   vars = {
#     // public_ssh_keys_list : jsonencode(var.public_ssh_keys_list)
#   }
# }

resource "google_compute_network" "vpc_network_one" {
  name = "terraform-network1"
}

# resource "google_compute_disk" "chain_disk_1" {
# name = "chain-disk-1"
# size = 80
# type = "pd-ssd"
# labels = {
#   environment = "dev"
# }
# }

# resource "google_compute_attached_disk" "default" {
#   disk     = google_compute_disk.chain_disk_1.id
#   instance = google_compute_instance.vm_instance_one.id
# }

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
      size  = 80
      type  = "pd-ssd"
      labels = {
        environment = "dev"
      }
    }
  }

  network_interface {
    network = google_compute_network.vpc_network_one.name
    access_config {
      nat_ip = google_compute_address.jenkins_static_ip.address
    }
  }

  # metadata = {
  #   # user-data = data.template_file.add_ssh_keys.rendered
  #   ssh-keys = join("\n", [for user, key in var.public_ssh_keys_map : "${user}:${key}"])
  # }
}

resource "google_compute_address" "jenkins_static_ip" {
  name = "jenkins-static-ip"
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network_one.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "443"]
  }

}



resource "google_compute_resource_policy" "chain_snapshot_schedule" {
  name = "chain-snapshot-schedule"

  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "02:00"
      }
    }
    retention_policy {
      max_retention_days    = 7
      on_source_disk_delete = "APPLY_RETENTION_POLICY"
    }
    snapshot_properties {
      labels = {
        app = "chain"
      }
    }
  }
}

resource "google_compute_disk_resource_policy_attachment" "attachment_bootdisk" {
  name = google_compute_resource_policy.chain_snapshot_schedule.name
  disk = google_compute_instance.vm_instance_one.name
}
# resource "google_compute_disk_resource_policy_attachment" "attachment_new_disk" {
#   name = google_compute_resource_policy.chain_snapshot_schedule.name
#   disk = google_compute_disk.chain_disk_1.name
# }
