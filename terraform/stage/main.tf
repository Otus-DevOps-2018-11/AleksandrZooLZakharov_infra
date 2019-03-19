provider "google" {
  version = "1.19.1"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  user                 = "${var.user}"
  source               = "../modules/app"
  user_public_key_path = "${var.user_public_key_path}"
  user_private_key_path = "${var.user_private_key_path}"
  zone                 = "${var.zone}"
  app_disk_image       = "${var.app_disk_image}"
}

module "db" {
  user                 = "${var.user}"
  source               = "../modules/db"
  user_public_key_path = "${var.user_public_key_path}"
  zone                 = "${var.zone}"
  db_disk_image        = "${var.db_disk_image}"
}

module "vpc" {
  source        	= "../modules/vpc"
  source_ranges 	= ["0.0.0.0/0"]
  user			= "${var.user}"
  user_public_key_path	= "${var.user_public_key_path}"
}
