resource "google_compute_instance" "app" {

  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-app"]

  # boot disk definition
  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  # send into the instance public keys
  metadata {
    ssh-keys = "${var.user}:${file("${var.user_public_key_path}")}"
  }
  # network interface definition
  network_interface {
    network = "default"
    access_config { nat_ip = "${google_compute_address.app_ip.address}" }
  }

  # provisioners connection
  connection {
    type        = "ssh"
    user        = "${var.user}"
    agent       = false
    private_key = "${file("${var.user_private_key_path}")}"
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

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"

    ports = ["9292", "80"]
  }

  source_ranges = ["0.0.0.0/0"]

  # involved instances
  target_tags = ["reddit-app"]
}
