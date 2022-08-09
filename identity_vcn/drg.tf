## Created by Saumya Padhi. Reach me at saumya.padhi@outlook.com/ admin@saumyapadhi.com
## DISCLAIMER: For educational purpose only, Do proper testing before using in Production.

resource "oci_core_drg" "drg01" {
    compartment_id = var.compartment_ocid
    display_name = var.drg01_display_name
    defined_tags = {"${oci_identity_tag_namespace.SaumyaPadhiTagNamespace.name}.${oci_identity_tag.SaumyaPadhiTag.name}" = var.release }
}

resource "oci_core_drg_attachment" "drg01_samhub_attachment" {
    drg_id = oci_core_drg.drg01.id
    vcn_id = oci_core_vcn.samhub.id
    display_name = var.drg01_samhub_attachment_display_name
}

resource "oci_core_drg_attachment" "drg_spoke01_attachment" {
    drg_id = oci_core_drg.drg01.id
    vcn_id = oci_core_vcn.spoke01.id
    display_name = var.drg01_spoke01_attachment_display_name
}

resource "oci_core_drg_attachment" "drg_spoke02_attachment" {
    drg_id = oci_core_drg.drg01.id
    vcn_id = oci_core_vcn.spoke02.id
    display_name = var.drg01_spoke02_attachment_display_name
}