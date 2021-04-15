
# resource "google_service_account" "default" {
#   account_id   = "service-account-id"
#   display_name = "Service Account"
# }

resource "google_compute_instance_template" "nodle_chain_template" {
  name_prefix = "nodle-chain-template-"
  description = "This template is used to create app server instances."

  tags = ["http-server", "https-server"]

  #   labels = {
  #     environment = "dev"
  #   }

  instance_description = "description assigned to instances"
  machine_type         = "e2-medium"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "ubuntu-2004-lts"
    disk_size_gb = 1000
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = var.vpc_name
  }

  metadata = {
    startup-script = var.startup_script
  }

  #   service_account {
  #     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  #     email  = google_service_account.default.email
  #     scopes = ["cloud-platform"]
  #   }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance_group_manager" "chain_group_manager" {
  name               = "chain-group-manager"
  base_instance_name = "chain"
  target_size        = "1"
  version {
    instance_template = google_compute_instance_template.nodle_chain_template.id
  }
}
