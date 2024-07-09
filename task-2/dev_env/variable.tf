###############################################################################################################
#                                               VPC_network varibales                                         #
###############################################################################################################

variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources to"
  type        = string
  default     = "us-central1"
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


###############################################################################################################
#                                               Cloud Run varibales                                           #
###############################################################################################################



variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
  default     = "hello-world"
}

variable "container_image" {
  description = "The container image to deploy"
  type        = string
}

variable "container_port" {
  description = "The port the container is listening on"
  type        = number
  default     = 80
}

variable "memory" {
  description = "The amount of memory to allocate to the service"
  type        = string
  default     = "256Mi"
}

variable "cpu" {
  description = "The number of CPUs to allocate to the service"
  type        = string
  default     = "1"
}

variable "max_instances" {
  description = "The maximum number of instances for the service"
  type        = number
  default     = 10
}

variable "vpc_connector_name" {
  description = "The name of the VPC connector"
  type        = string
}

variable "vpc_connector_cidr_range" {
  type = string
  default = "10.8.0.0/28"
}