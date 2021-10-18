# Titan Environment Module - Inherited Variables from TTIAN Network Module

# See the Titan Network Module for documentation
variable domain {}

variable domain_name_servers {
  type = list(string)
  default = ["AmazonProvidedDNS"]
}

variable instance_tenancy {
  default = "default"
}

variable name {}
variable name_fancy {}
variable name_short {}

variable netbios_name_servers {
  type = list(string)
  default = []
}

variable netbios_node_type {
  default = "2"
}

variable network_id {}

variable ntp_servers {
  type = list(string)
  default = ["169.254.169.123"]
}

variable subnets_per_layer {
  default = "3"
}
