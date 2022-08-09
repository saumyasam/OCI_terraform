## Created by Saumya Padhi. Reach me at saumya.padhi@outlook.com/ admin@saumyapadhi.com
## DISCLAIMER: For educational purpose only, Do proper testing before using in Production.

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid        
  fingerprint      = var.fingerprint      
  private_key_path = var.private_key_path 
  region           = var.region
}

provider "oci" {
  alias            = "homeregion"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid        
  fingerprint      = var.fingerprint      
  private_key_path = var.private_key_path 
  region           = data.oci_identity_region_subscriptions.home_region_subscriptions.region_subscriptions[0].region_name
}