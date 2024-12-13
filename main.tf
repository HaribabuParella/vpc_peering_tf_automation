provider "google" {
  project     = "hari-gcp-learning-project"
  region      = "us-west1"
}

resource "google_compute_network" "vpc3-custom" {
  name                    = "vpc3-custom"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc3-custom-subnet1" {
  name          = "vpc3-subnetwork1"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.vpc3-custom.name
}
resource "google_compute_subnetwork" "vpc3-custom-subnet2" {
  name          = "vpc3-subnetwork2"
  ip_cidr_range = "10.3.0.0/16"
  region        = "us-west2"
  network       = google_compute_network.vpc3-custom.name
}
resource "google_compute_subnetwork" "vpc3-custom-subnet3" {
  name          = "vpc3-subnetwork3"
  ip_cidr_range = "10.4.0.0/16"
  region        = "us-west4"
  network       = google_compute_network.vpc3-custom.name
}

resource "google_compute_network" "vpc4-custom" {
  name                    = "vpc4-custom"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc4-custom-subnet1" {
  name          = "vpc4-subnetwork1"
  ip_cidr_range = "10.5.0.0/16"
  region        = "us-east1"
  network       = google_compute_network.vpc4-custom.name
}
resource "google_compute_subnetwork" "vpc4-custom-subnet2" {
  name          = "vpc4-subnetwork2"
  ip_cidr_range = "10.5.0.0/16"
  region        = "us-east4"
  network       = google_compute_network.vpc4-custom.name
}
resource "google_compute_subnetwork" "vpc4-custom-subnet3" {
  name          = "vpc4-subnetwork3"
  ip_cidr_range = "10.5.0.0/16"
  region        = "us-east5"
  network       = google_compute_network.vpc4-custom.name
}
resource "google_compute_network_peering" "custom-vpc3-custom" {
  name         = "custom-vpc3-custom"
  network      = google_compute_network.vpc3-custom.self_link
  peer_network = google_compute_network.vpc4-custom.self_link
}

resource "google_compute_network_peering" "custom-vpc4-custom" {
  name         = "custom-vpc4-custom"
  network      = google_compute_network.vpc4-custom.self_link
  peer_network = google_compute_network.vpc3-custom.self_link
}
