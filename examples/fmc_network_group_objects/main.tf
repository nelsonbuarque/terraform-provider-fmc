terraform {
  required_providers {
    fmc = {
      source = "CiscoDevNet/fmc"
      # version = "0.1.1"
    }
  }
}

provider "fmc" {
  fmc_username = var.fmc_username
  fmc_password = var.fmc_password
  fmc_host = var.fmc_host
  fmc_insecure_skip_verify = var.fmc_insecure_skip_verify
}

#data "fmc_network_objects" "PrivateVLAN" {
#  name = "VLAN825-Private"
#}

#resource "fmc_network_objects" "PrivateVLANDR" {
#  name        = "DRsite-VLAN"
#  value       = data.fmc_network_objects.PrivateVLAN.value
#  description = "testing terraform"
#


resource "fmc_network_objects" "terraform_test_host_7" {
  name        = "terraform_test_host_7"
  value       = "192.168.44.0/24"
  description = "testing terraform change"
}

resource "fmc_network_objects" "terraform_test_host_8" {
  name        = "terraform_test_host_8"
  value       = "10.0.1.0/24"
  description = "testing terraform change"
}


resource "fmc_network_group_objects" "terraform_TestPrivateGroup_1" {
  name = "terraform_TestPrivateGroup_1"
  description = "Testing groups"
  objects {
      id = fmc_network_objects.terraform_test_host_7.id
      type = fmc_network_objects.terraform_test_host_7.type
  }
  objects {
      id = fmc_network_objects.terraform_test_host_8.id
      type = fmc_network_objects.terraform_test_host_8.type
  }
  literals {
      value = "100.100.100.222"
      type = "Host"
  }
}

#output "existing_fmc_network_object" {
#  value = data.fmc_network_objects.PrivateVLAN
#}

output "new_fmc_network_object" {
  value = fmc_network_objects.terraform_test_host_7
}

output "new_fmc_network_object_2" {
  value = fmc_network_objects.terraform_test_host_8
}

output "new_fmc_network_group_object" {
  value = fmc_network_group_objects.terraform_TestPrivateGroup_1
}
