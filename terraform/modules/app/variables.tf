variable user {
  description = "Ssh username"
}

variable user_public_key_path {
  description = "Path to the public key used for ssh access"
}

variable user_private_key_path {
  description = "Path to the private key used by provisioners for ssh access"
}

variable zone {
  description = "Zone in Region"
  default     = "europe-west1-d"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
