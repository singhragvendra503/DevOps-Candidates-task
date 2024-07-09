provider "google" {
  credentials = file("./ferret-cloud-dev-555c59a87645.json")
  project = var.project_id
  region  = var.region
}

module "vpc_network" {
  source = "../modules/vpc"
  ports = var.ports
  public_subnets_cidr_range = var.public_subnets_cidr_range
  private_subnets_cidr_range = var.private_subnets_cidr_range
  region = var.region
  environment = var.environment
  appname = var.appname
}

module "cloud_run" {
  source = "../modules/cloud-run"
  region = var.region
  project_id = var.project_id
  container_image = var.container_image
  vpc_connector_name = var.vpc_connector_name
  public_subnet_id = module.vpc_network.public_subnet_id
  vpc_network_name = module.vpc_network.vpc_name
  cpu = var.cpu
  memory = var.memory
  max_instances = var.max_instances
  vpc_connector_cidr_range = var.vpc_connector_cidr_range
}