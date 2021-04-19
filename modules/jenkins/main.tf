
### network

resource "google_compute_address" "jenkins_static_ip" {
  name = "jenkins-static-ip"
}

### instance creation

resource "google_compute_instance" "instance_jenkins" {
  name                = "terraform-instance1"
  machine_type        = "e2-standard-2"
  tags                = ["managment", "jenkins"]
  deletion_protection = true
  depends_on = [
    google_compute_address.jenkins_static_ip
  ]

  metadata = {
    startup-script = var.startup_script
  }

  boot_disk {
    auto_delete = false
    initialize_params {
      # image = "ubuntu-2004-lts"
      # size = 1000
      type = "pd-ssd"
      labels = {
      }
    }
  }

  network_interface {
    network = var.vpc_name
    access_config {
      nat_ip = google_compute_address.jenkins_static_ip.address
    }
  }

}


### backup policy

resource "google_compute_resource_policy" "jenkins_snapshot_schedule" {
  name = "jenkins-snapshot-schedule"

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

resource "google_compute_disk_resource_policy_attachment" "attach_snapshot_schedule" {
  name = google_compute_resource_policy.jenkins_snapshot_schedule.name
  disk = google_compute_instance.instance_jenkins.name
}
