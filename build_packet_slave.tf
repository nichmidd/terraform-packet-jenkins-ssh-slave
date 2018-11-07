variable "project_id" {
  type = "string"
}
variable "auth_token" {
  type = "string"
}
variable "hostname" {
  type = "string"
}


provider "packet" {
  auth_token = "${var.auth_token}"
}

resource "packet_device" "jenkinsslave" {
  hostname = "${var.hostname}"
  plan = "baremetal_1e"
  facility = "syd1"
  operating_system = "debian_9"
  billing_cycle = "hourly"
  project_id = "${var.project_id}"
  user_data = "${file("installBuildDependancies.sh")}"
}

output "maintenanceaddr" {
  value = "${packet_device.jenkinsslave.access_public_ipv4}"
}
