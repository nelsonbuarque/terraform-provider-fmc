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


resource "fmc_network_objects" "terraform_test_host_6" {
  name        = "terraform_test_host_6"
  value       = "192.168.44.0/24"
  description = "testing terraform change"
}

resource "fmc_network_objects" "terraform_test_host_5" {
  name        = "terraform_test_host_5"
  value       = "1.1.1.200/32"
  description = "testing terraform change"
}


resource "fmc_network_group_objects" "terraform_TestPrivateGroup" {
  name = "terraform_TestPrivateGroup"
  description = "Testing groups"
  objects {
      id = fmc_network_objects.terraform_test_host_6.id
      type = fmc_network_objects.terraform_test_host_6.type
  }
  objects {
      id = fmc_network_objects.terraform_test_host_5.id
      type = fmc_network_objects.terraform_test_host_5.type
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
  value = fmc_network_objects.terraform_test_host_6
}

output "new_fmc_network_object_2" {
  value = fmc_network_objects.terraform_test_host_5
}

output "new_fmc_network_group_object" {
  value = fmc_network_group_objects.terraform_TestPrivateGroup
}
