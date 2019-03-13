variable project {
  description = "Project ID"
}

variable user {
  description = "Ssh username"
}

variable user1 {
  description = "Ssh username"
}

variable user2 {
  description = "Ssh username"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable user_public_key_path {
  description = "Path to the public key used for ssh access"
}

variable user_private_key_path {
  description = "Path to the private key used for ssh access"
}

variable user1_public_key_path {
  description = "Path to the public key used for ssh access"
}

variable user2_public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable zone {
  description = "Zone in Region"
  default     = "europe-west1-d"
}
