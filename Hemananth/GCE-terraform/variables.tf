variable "region" {
  default = "us-central1"
}

variable "region_zone" {
  default = "us-central1-a"
}

variable "project_name" {
  description = "my Cloud Project"
  default     = "absolute-realm-322617"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/gcloud/credentials.json"
}


variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "~/.ssh/gcloud_id_rsa.pub"
}
variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "~/.ssh/gcloud_id_rsa"
}
variable "email" {
  description = "my email"
  default     = "gkeserviceaccount@absolute-realm-322617.iam.gserviceaccou
nt.com"
}
