variable "region" {
  type        = string
  default     = "us-east4"
  description = "Enter valid region where you want to create resources"
}


variable "ports" {
  type        = list(string)
  default     = ["22"]
  description = "List of ports to open for ingress traffic"
}

variable "appname" {
  type = string
  description = "Your project name like 'netfix', 'notes-app' etc"
}

variable "environment" {
  type = string
  description = "Envieonment name like 'DEV', 'STAGING', 'PROD'"
}

variable "private_subnets_cidr_range" {
  type = list(string)
  default = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
  ]
}

variable "public_subnets_cidr_range" {
  type = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
  ]
}