## Created by Saumya Padhi. Reach me at saumya.padhi@outlook.com/ admin@saumyapadhi.com
## DISCLAIMER: For educational purpose only, Do proper testing before using in Production.

resource "oci_core_vcn" "spoke01" {
  cidr_block     = var.spoke01_vcn_cidr_block
  dns_label      = var.spoke01_vcn_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.spoke01_vcn_display_name
  defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}

#Default route table spoke01
resource "oci_core_default_route_table" "spoke01_default_route_table" {
    manage_default_resource_id = oci_core_vcn.spoke01.default_route_table_id
    route_rules {
        network_entity_id = oci_core_drg.drg01.id
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
    }
    defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}

resource "oci_core_subnet" "spoke01_subnet_priv01" {
    cidr_block = var.spoke01_subnet_priv01_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.spoke01.id
    display_name = var.spoke01_subnet_priv01_display_name
    defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}