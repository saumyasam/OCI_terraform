## Created by Saumya Padhi. Reach me at saumya.padhi@outlook.com/ admin@saumyapadhi.com
## DISCLAIMER: For educational purpose only, Do proper testing before using in Production.

resource "oci_core_vcn" "sampro" {
  cidr_blocks     = var.sampro_vcn_cidr_blocks
  dns_label      = var.sampro_vcn_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.sampro_vcn_display_name
  defined_tags   = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}


##sampro mgmt/pub subnet
resource "oci_core_subnet" "sampro_mgmt_snet01" {
    cidr_block = var.sampro_mgmt_snet01_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.sampro.id
    display_name = var.sampro_mgmt_snet01_display_name
    prohibit_public_ip_on_vnic = false
    defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}

resource "oci_core_subnet" "sampro_db_snet01" {
    cidr_block = var.sampro_db_snet01_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.sampro.id
    display_name = var.sampro_db_snet01_display_name
    prohibit_public_ip_on_vnic = true
    defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}

resource "oci_core_subnet" "sampro_app_snet01" {
    cidr_block = var.sampro_app_snet01_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.sampro.id
    display_name = var.sampro_app_snet01_display_name
    prohibit_public_ip_on_vnic = true
    defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}