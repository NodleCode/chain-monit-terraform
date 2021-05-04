
#resource "google_compute_network" "default" {
#  name = ""
#}

# resource "google_compute_subnetwork" "default" {
#   name          = "my-subnet"
#   ip_cidr_range = "10.0.0.0/16"
#   region        = "us-central1"
#   network       = google_compute_network.default.id
# }

resource "google_compute_network" "vpc_network_zero" {
  name = "nodle-chain-vpc"
}

resource "google_compute_firewall" "default" {
  name    = "nodle-chain-firewall"
  network = google_compute_network.vpc_network_zero.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "443", "9944", "5555", "30333", "9933", "3389", "8081"]
  }

}
