resource "oci_core_security_list" "Sam_Pub_Securitylist01" {
    compartment_id = var.compartment_ocid
    display_name = "Sam_Pub_Securitylist01"
    vcn_id = oci_core_vcn.sampro.id
    
    egress_security_rules {
        protocol = "6"
        destination = "0.0.0.0/0"
    }
    
    dynamic "ingress_security_rules" {
    for_each = var.service_ports
    content {
        protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            max = ingress_security_rules.value
            min = ingress_security_rules.value
            }
        }
    }

    ingress_security_rules {
        protocol = "6"
        source = var.sampro_vcn_cidr_blocks[0]
    }
}

resource "oci_core_security_list" "Sam_DB_Securitylist01" {
    compartment_id = var.compartment_ocid
    display_name = "Sam_DB_Securitylist01"
    vcn_id = oci_core_vcn.sampro.id
    
    egress_security_rules {
        protocol = "6"
        destination = "0.0.0.0/0"
    }
    
    dynamic "ingress_security_rules" {
    for_each = var.service_ports
    content {
        protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            max = ingress_security_rules.value
            min = ingress_security_rules.value
            }
        }
    }

    ingress_security_rules {
        protocol = "6"
        source = var.sampro_vcn_cidr_blocks[0]
    }
}


resource "oci_core_security_list" "Sam_App_Securitylist01" {
    compartment_id = var.compartment_ocid
    display_name = "Sam_App_Securitylist01"
    vcn_id = oci_core_vcn.sampro.id
    
    egress_security_rules {
        protocol = "6"
        destination = "0.0.0.0/0"
    }
    
    dynamic "ingress_security_rules" {
    for_each = var.service_ports
    content {
        protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            max = ingress_security_rules.value
            min = ingress_security_rules.value
            }
        }
    }

    ingress_security_rules {
        protocol = "6"
        source = var.sampro_vcn_cidr_blocks[0]
    }
}