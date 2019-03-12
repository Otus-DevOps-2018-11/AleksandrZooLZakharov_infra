provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "f1-micro"
  zone         = "${var.zone}"
  tags         = ["reddit-app"]

  # provisioners connection
  connection {
    type        = "ssh"
    user        = "avzakharov77"
    agent       = false
    private_key = "${file("${var.private_key_path}")}"
  }

  # boot disk definition
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  # send into the instance public keys
  metadata {
    ssh-keys = "${var.user}:${file("${var.public_key_path}")}"
  }

  # network interface definition
  network_interface {
    # network name to joining this interface
    network = "default"

    # use ephemeral IP for access from Internet
    access_config {}
  }

  # Provisioning
  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_project_metadata_item" "ssh_public_keys" {
  key = "ssh-keys"
  value = "${var.user}:${file("${var.public_key_path}")} ${var.user1}:${file("${var.user1_public_key_path}")} ${var.user2}:${file("${var.user2_public_key_path}")}"
}


resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"

  # Network name
  network = "default"

  # Allowed protokol & port
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  # Allowed source adresses
  source_ranges = ["0.0.0.0/0"]

  # involved instances
  target_tags = ["reddit-app"]
}