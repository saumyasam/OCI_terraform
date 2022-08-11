## Created by Saumya Padhi. Reach me at saumya.padhi@outlook.com/ admin@saumyapadhi.com
## DISCLAIMER: For educational purpose only, Do proper testing before using in Production.

#IGW 
resource "oci_core_internet_gateway" "sampro_internet_gateway" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.sampro.id
    enabled = "true"
    display_name = var.igw_display_name
    defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}

#DRG
resource "oci_core_drg" "drg01" {
    compartment_id = var.compartment_ocid
    display_name = var.drg01_display_name
    defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}

# DRG Attachment
resource "oci_core_drg_attachment" "drg01_sampro_attachment" {
    drg_id = oci_core_drg.drg01.id
    vcn_id = oci_core_vcn.sampro.id
    display_name = var.drg01_sampro_attachment_display_name
}


#Default route table sampro VCN
resource "oci_core_default_route_table" "sampro_default_route_table" {
    manage_default_resource_id = oci_core_vcn.sampro.default_route_table_id
    route_rules {
        network_entity_id = oci_core_internet_gateway.sampro_internet_gateway.id
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
    }
    defined_tags         = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}


