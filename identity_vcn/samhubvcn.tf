## Created by Saumya Padhi. Reach me at saumya.padhi@outlook.com/ admin@saumyapadhi.com
## DISCLAIMER: For educational purpose only, Do proper testing before using in Production.

resource "oci_core_vcn" "samhub" {
  cidr_block     = var.samhub_vcn_cidr_block
  dns_label      = var.samhub_vcn_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.samhub_vcn_display_name
  defined_tags   = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}

#IGW
resource "oci_core_internet_gateway" "samhub_internet_gateway" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.samhub.id
    enabled = "true"
    display_name = var.igw_display_name
    defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}

#Default route table samhub
resource "oci_core_default_route_table" "samhub_default_route_table" {
    manage_default_resource_id = oci_core_vcn.samhub.default_route_table_id
    route_rules {
        network_entity_id = oci_core_internet_gateway.samhub_internet_gateway.id
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_drg.drg01.id
        destination       = var.spoke01_vcn_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_drg.drg01.id
        destination       = var.spoke02_vcn_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    defined_tags         = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}



#samhub pub subnet
resource "oci_core_subnet" "samhub_subnet_pub01" {
    cidr_block = var.samhub_subnet_pub01_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.samhub.id
    display_name = var.samhub_subnet_pub01_display_name
    defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}
