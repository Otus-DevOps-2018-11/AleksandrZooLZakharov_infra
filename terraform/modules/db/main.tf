resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "f1-micro"
  zone         = "${var.zone}"
  tags         = ["reddit-db"]

  # boot disk definition
  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  # network interface definition
  network_interface {
    network       = "default"
    access_config = {}
  }

  # send into the instance public keys
  metadata {
    ssh-keys = "${var.user}:${file("${var.user_public_key_path}")}"
  }
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"

  allow {
    protocol = "tcp"

    ports = ["27017"]
  }

  # involved instances
  source_tags = ["reddit-app"]
  target_tags = ["reddit-db"]
}
