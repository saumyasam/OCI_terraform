resource oci_identity_compartment "saumyasam-prod-db-cmp01" {
  name = "saumyasam-prod-db-cmp01"
  description = "Compartment for Saumyasam Prod DB"
  compartment_id = var.root_compartment_id
  defined_tags = { }
  enable_delete = "true"
}

resource oci_identity_compartment "saumyasam-prod-app-cmp01" {
  name = "saumyasam-prod-app-cmp01"
  description = "Compartment for Saumyasam Prod App"
  compartment_id = var.root_compartment_id
  defined_tags = { }
  enable_delete = "true"
}

resource oci_identity_compartment "saumyasam-prod-netmgmt-cmp01" {
  name = "saumyasam-prod-netmgmt-cmp01"
  description = "Compartment for Saumyasam Prod NW Management-Public"
  compartment_id = var.root_compartment_id
  defined_tags = { }
  enable_delete = "true"
}
