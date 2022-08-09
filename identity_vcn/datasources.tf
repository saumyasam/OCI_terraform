## Created by Saumya Padhi. Reach me at saumya.padhi@outlook.com/ admin@saumyapadhi.com
## DISCLAIMER: For educational purpose only, Do proper testing before using in Production.

# Get list of availability domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

# Get the latest Oracle Linux image
data "oci_core_images" "InstanceImageOCID" {
  compartment_id           = var.compartment_ocid 
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version
  shape                    = var.InstanceShape

  filter {
    name   = "display_name"
    values = ["^.*Oracle[^G]*$"]
    regex  = true
  }
}

data "oci_identity_region_subscriptions" "home_region_subscriptions" {
    tenancy_id = var.tenancy_ocid

    filter {
      name   = "is_home_region"
      values = [true]
    }
}