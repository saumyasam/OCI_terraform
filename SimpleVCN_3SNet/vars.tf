## Created by Saumya Padhi. Reach me at saumya.padhi@outlook.com/ admin@saumyapadhi.com
## DISCLAIMER: For educational purpose only, Do proper testing before using in Production.

variable "region" {}
      
variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaafje7wqfgx7lm4eejl7wgyhr6wwp4rdrmng3ynnmdajxlq7ifts3a"
}        

variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaa6eakkrysf6znwg73cdaxxtkqyhklq37rj7dpx2scwsp2rocqj6ra"
}
variable "compartment_ocid" { 
 default = "ocid1.compartment.oc1..aaaaaaaawkghy6ilnmohsjpa4dq256f5c3sv3rybhfgwx3445l4s4xaelmta"
}

variable root_compartment_id { 
 default = "ocid1.tenancy.oc1..aaaaaaaa6eakkrysf6znwg73cdaxxtkqyhklq37rj7dpx2scwsp2rocqj6ra" 
 }

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

#Gateway details
variable "igw_display_name" {
  default = "sam-internet-gateway"
}


variable "drg01_display_name" {
  default = "SAMDRG01"
}

variable "drg01_sampro_attachment_display_name" {
  default = "DRG01_sampro Attachment"
}

variable "drg01_samspoke_attachment_display_name" {
  default = "DRG01_samspoke Attachment"
}

#VCN Variables - sampro

variable "sampro_vcn_cidr_blocks" {
  type = list(string)
  default = ["10.0.0.0/16","172.168.0.0/16"]
  }
variable "sampro_vcn_dns_label" {
  default = "sampro"
}
variable "sampro_vcn_display_name" {
  default = "sampro_vcn"
}

# MGMT/PUB Subnet
variable "sampro_mgmt_snet01_cidr_block" {
  default = "10.0.0.0/24"
}

variable "sampro_mgmt_snet01_display_name" {
  default = "sampro_pubsubnet"
}

#DB Subnet
variable "sampro_db_snet01_cidr_block" {
  default = "172.168.1.0/24"
}

variable "sampro_db_snet01_display_name" {
  default = "sampro_dbsubnet"
}

#APP Subnet
variable "sampro_app_snet01_cidr_block" {
  default = "172.168.2.0/24"
}

variable "sampro_app_snet01_display_name" {
  default = "sampro_appsubnet"
}

variable "service_ports" {
  type = list(string)
  default = [80,443,22]
}
