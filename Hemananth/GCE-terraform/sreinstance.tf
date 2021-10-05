provider "google" {
  region      = var.region
  project     = var.project_name
  credentials = file("~/gcloud/credentials.json")
}
data "google_container_registry_image" "sreflaskapp" {
  name = "sreflaskapp"
}
output "gcr_location" {
  value = data.google_container_registry_image.sreflaskapp.image_url
}
data "template_file" "docker"{
    template = file("~/teststart.sh")
} 

resource "google_compute_instance" "sretestingterminal" {
  count = 1
  name         = "sreterminal-${count.index}"
  machine_type = "e2-medium"
  zone         = var.region_zone
  tags         = ["docker-node"]
  boot_disk {
    initialize_params {
      image = "centos-7-v20210817"
    }
  }
 network_interface {
    network = "default"
    access_config {
          #nat_ip = google_compute_address.static.address
    }
  }
   service_account {
    email  = var.email
    scopes = [ "https://www.googleapis.com/auth/devstorage.read_only",
               "https://www.googleapis.com/auth/logging.write",
               "https://www.googleapis.com/auth/monitoring.write",
               "https://www.googleapis.com/auth/service.management.readonly",
               "https://www.googleapis.com/auth/servicecontrol",
               "https://www.googleapis.com/auth/cloud-platform"]

  }

 metadata_startup_script = data.template_file.docker.rendered

}



resource "google_compute_firewall" "default" {
  name    = "defaultterraform9090"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9090","8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker-node"]
}
