variable tenancy_ocid { default = "ocid1.tenancy.oc1..aaaaaaaa6eakkrysf6znwg73cdaxxtkqyhklq37rj7dpx2scwsp2rocqj6ra" }
variable root_compartment_id { default = "ocid1.tenancy.oc1..aaaaaaaa6eakkrysf6znwg73cdaxxtkqyhklq37rj7dpx2scwsp2rocqj6ra" }
variable compartment_ocid { default = "ocid1.user.oc1..aaaaaaaafje7wqfgx7lm4eejl7wgyhr6wwp4rdrmng3ynnmdajxlq7ifts3a" }
variable region { default = "uk-london-1" }
 

## Copyright (c) 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "region" {}
variable "fingerprint" {}      
variable "user_ocid" {}        
variable "private_key_path" {} 
variable "tenancy_ocid" {}
variable "compartment_ocid" {}

variable "availability_domain_name" {
  default = ""
}

variable "availability_domain_number" {
  default = 0
}

variable "release" {
  description = "Sam Architecture Release"
  default     = "1.0"
}

variable "igw_display_name" {
  default = "sam-internet-gateway"
}


variable "drg01_display_name" {
  default = "DRG01"
}

variable "drg01_samhub_attachment_display_name" {
  default = "DRG01_samhub Attachment"
}

variable "drg01_spoke01_attachment_display_name" {
  default = "DRG01_SPOKE01 Attachment"
}

variable "drg01_spoke02_attachment_display_name" {
  default = "DRG01_SPOKE02 Attachment"
}

variable "samhub_vcn_cidr_block" {
  default = "10.0.0.0/16"
}
variable "samhub_vcn_dns_label" {
  default = "samhubvcn"
}
variable "samhub_vcn_display_name" {
  default = "samhub_vcn"
}

variable "samhub_subnet_pub01_cidr_block" {
  default = "10.0.0.0/24"
}

variable "samhub_subnet_pub01_display_name" {
  default = "samhub_subnet_pub01"
}

# spoke01
variable "spoke01_vcn_cidr_block" {
  default = "10.10.0.0/16"
}
variable "spoke01_vcn_dns_label" {
  default = "spoke01vcn"
}
variable "spoke01_vcn_display_name" {
  default = "spoke01_vcn"
}
variable "spoke01_subnet_priv01_cidr_block" {
  default = "10.10.0.0/24"
}
variable "spoke01_subnet_priv01_display_name" {
  default = "spoke01_subnet_priv01"
}

# spoke02
variable "spoke02_vcn_cidr_block" {
  default = "10.20.0.0/16"
}
variable "spoke02_vcn_dns_label" {
  default = "spoke02vcn"
}
variable "spoke02_vcn_display_name" {
  default = "spoke02_vcn"
}

variable "spoke02_subnet_priv01_cidr_block" {
  default = "10.20.0.0/24"
}

variable "spoke02_subnet_priv01_display_name" {
  default = "spoke02_subnet_priv01"
}

variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default = "8"
}

variable "InstanceShape" {
  default = "VM.Standard.E4.Flex"
}

variable "InstanceFlexShapeOCPUS" {
  default = 1
}

variable "InstanceFlexShapeMemory" {
  default = 10
}

variable "ssh_public_key" {
  default = ""
}

variable "deploy_spoke01_instance" {
  default = true ### revert to false
}

variable "InstanceShapeSpoke01" {
  default = "VM.Standard.E4.Flex"
}

variable "InstanceFlexShapeOCPUSSpoke01" {
  default = 1
}

variable "InstanceFlexShapeMemorySpoke01" {
  default = 10
}

variable "deploy_spoke02_instance" {
  default = true ### revert to false
}

variable "InstanceShapeSpoke02" {
  default = "VM.Standard.E4.Flex"
}

variable "InstanceFlexShapeOCPUSSpoke02" {
  default = 1
}

variable "InstanceFlexShapeMemorySpoke02" {
  default = 10
}

# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex",
    "VM.Standard.A1.Flex"
  ]
}

# Checks if is using Flexible Compute Shapes
locals {
  is_flexible_node_shape         = contains(local.compute_flexible_shapes, var.InstanceShape)
  is_flexible_node_shape_spoke01 = contains(local.compute_flexible_shapes, var.InstanceShapeSpoke01)
  is_flexible_node_shape_spoke02 = contains(local.compute_flexible_shapes, var.InstanceShapeSpoke02)
  availability_domain_name       = var.availability_domain_name == "" ? lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.availability_domain_number], "name") : var.availability_domain_name
}