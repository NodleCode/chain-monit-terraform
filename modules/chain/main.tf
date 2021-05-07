resource "google_service_account" "nodle-chain" {
  account_id   = "nodle-chain-service-account"
  display_name = "Service Account Nodle Chain"
}

resource "google_compute_instance_template" "nodle_chain_template" {
  name_prefix = "nodle-chain-template-"
  description = "This template is used to create app server instances."

  tags = ["nodle-chain", "production"]

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
    # An empty access_config block would assign an external ephemeral IP to your instance
    access_config {}
  }

  metadata = {
    startup-script = var.startup_script
  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "144654230718-compute@developer.gserviceaccount.com"
    scopes = ["logging-write", "monitoring-write", "service-control", "storage-ro", "service-management", "monitoring"]
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_health_check" "ping_chain_monit" {
  name                = "nodle-chain-monit-ping"
  check_interval_sec  = 10
  timeout_sec         = 10
  healthy_threshold   = 2
  unhealthy_threshold = 10 # 60 seconds

  http_health_check {
    request_path = "/"
    port         = "8080"
  }
}

resource "google_compute_region_instance_group_manager" "chain_group_manager" {
  # Use google_compute_region_instance_group_manager to create a regional (multi-zone) instance group manager.
  name               = "nodle-chain-group-manager"
  base_instance_name = "chain"
  target_size        = "5"

  update_policy {
    # TODO
    type               = "PROACTIVE"
    minimal_action     = "REPLACE"
    replacement_method = "SUBSTITUTE"
    max_surge_fixed    = 5
    #max_unavailable_fixed = "0"
  }
  version {
    instance_template = google_compute_instance_template.nodle_chain_template.id
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.ping_chain_monit.id
    initial_delay_sec = 1800
  }
  named_port {
    name = "nodle-chain-ws"
    port = 9944
  }
}
