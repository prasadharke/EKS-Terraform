provider "aws" {

}

variable "cluster_name" {
  default = "Sunbird-ed"
}

variable "cluster_version" {
  default = "1.29"
}


variable "ssh_key" {
  description = "The ssh key"
  type        = string
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
