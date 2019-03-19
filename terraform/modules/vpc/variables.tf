variable source_ranges {
  description = "Allowed ip addresses"
  default     = ["0.0.0.0/0"]
}

variable user {
  description = "ssh username"
}

variable user_public_key_path {
  description = "path to public ssh key"
}