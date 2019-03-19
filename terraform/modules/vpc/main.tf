resource "google_compute_firewall" "firewall_ssh" {
  name        = "default-allow-ssh"
  network     = "default"
  description = "Allow ssh from anywhere"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.source_ranges}"
}

resource "google_compute_project_metadata_item" "ssh_public_keys" {
  key = "ssh-keys"
  value = "${var.user}:${file("${var.user_public_key_path}")}"
}