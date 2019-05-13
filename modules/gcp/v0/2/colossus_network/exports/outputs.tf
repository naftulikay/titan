# Exported Outputs from the Colossus Network Module

# Network
output "cidr_block"                     { value = "${module.network.cidr_block}" }
output "default_gateway_ipv4"           { value = "${module.network.default_gateway_ipv4}" }
output "id"                             { value = "${module.network.id}" }
output "name"                           { value = "${module.network.name}" }
output "name_fancy"                     { value = "${module.network.name_fancy}" }
output "name_short"                     { value = "${module.network.name_short}" }
output "public_route_name"              { value = "${module.network.public_route_name}" }
output "public_route_id"                { value = "${module.network.public_route_id}" }
output "public_route_priority"          { value = "${module.network.public_route_priority}" }
output "public_route_tags"              { value = ["${module.network.public_route_tags}"] }
output "public_zone_id"                 { value = "${module.network.public_zone_id}" }
output "public_zone_name"               { value = "${module.network.public_zone_name}" }
output "public_zone_nameservers"        { value = ["${module.network.public_zone_nameservers}"] }
output "region"                         { value = "${module.network.region}" }
output "uninitialized_space"            { value = "${module.network.uninitialized_space}" }
output "vpc_id"                         { value = "${module.network.vpc_id}" }
output "vpc_name"                       { value = "${module.network.vpc_name}" }
output "zone"                           { value = "${module.network.zone}" }

# NAT
output "nat_public_ips"                 { value = ["${module.network.nat_public_ips}"] }


# Admin Layer
output "admin_cidr_block"               { value = "${module.network.admin_cidr_block}" }
output "admin_container_cidr_block"     { value = "${module.network.admin_container_cidr_block}" }
output "admin_container_range_name"     { value = "${module.network.admin_container_range_name}" }
output "admin_gateway_address"          { value = "${module.network.admin_gateway_address}" }
output "admin_index"                    { value = "${module.network.admin_index}" }
output "admin_services_cidr_block"      { value = "${module.network.admin_services_cidr_block}" }
output "admin_services_range_name"      { value = "${module.network.admin_services_range_name}" }
output "admin_name"                     { value = "${module.network.admin_name}" }
output "admin_name_fancy"               { value = "${module.network.admin_name_fancy}" }
output "admin_subnet_id"                { value = "${module.network.admin_subnet_id}" }

# Data Layer
output "data_cidr_block"                { value = "${module.network.data_cidr_block}" }
output "data_container_cidr_block"      { value = "${module.network.data_container_cidr_block}" }
output "data_container_range_name"      { value = "${module.network.data_container_range_name}" }
output "data_gateway_address"           { value = "${module.network.data_gateway_address}" }
output "data_index"                     { value = "${module.network.data_index}" }
output "data_services_cidr_block"       { value = "${module.network.data_services_cidr_block}" }
output "data_services_range_name"       { value = "${module.network.data_services_range_name}" }
output "data_name"                      { value = "${module.network.data_name}" }
output "data_name_fancy"                { value = "${module.network.data_name_fancy}" }
output "data_subnet_id"                 { value = "${module.network.data_subnet_id}" }

# DMZ Layer
output "dmz_cidr_block"                 { value = "${module.network.dmz_cidr_block}" }
output "dmz_container_cidr_block"       { value = "${module.network.dmz_container_cidr_block}" }
output "dmz_container_range_name"       { value = "${module.network.dmz_container_range_name}" }
output "dmz_gateway_address"            { value = "${module.network.dmz_gateway_address}" }
output "dmz_index"                      { value = "${module.network.dmz_index}" }
output "dmz_services_cidr_block"        { value = "${module.network.dmz_services_cidr_block}" }
output "dmz_services_range_name"        { value = "${module.network.dmz_services_range_name}" }
output "dmz_name"                       { value = "${module.network.dmz_name}" }
output "dmz_name_fancy"                 { value = "${module.network.dmz_name_fancy}" }
output "dmz_subnet_id"                  { value = "${module.network.dmz_subnet_id}" }

# Routing
output "routing_cidr_block"             { value = "${module.network.routing_cidr_block}" }
output "routing_container_cidr_block"   { value = "${module.network.routing_container_cidr_block}" }
output "routing_container_range_name"   { value = "${module.network.routing_container_range_name}" }
output "routing_gateway_address"        { value = "${module.network.routing_gateway_address}" }
output "routing_index"                  { value = "${module.network.routing_index}" }
output "routing_services_cidr_block"    { value = "${module.network.routing_services_cidr_block}" }
output "routing_services_range_name"    { value = "${module.network.routing_services_range_name}" }
output "routing_name"                   { value = "${module.network.routing_name}" }
output "routing_name_fancy"             { value = "${module.network.routing_name_fancy}" }
output "routing_subnet_id"              { value = "${module.network.routing_subnet_id}" }

# Services
output "services_cidr_block"            { value = "${module.network.routing_cidr_block}" }
output "services_container_cidr_block"  { value = "${module.network.routing_container_cidr_block}" }
output "services_container_range_name"  { value = "${module.network.routing_container_range_name}" }
output "services_gateway_address"       { value = "${module.network.routing_gateway_address}" }
output "services_index"                 { value = "${module.network.routing_index}" }
output "services_services_cidr_block"   { value = "${module.network.routing_services_cidr_block}" }
output "services_services_range_name"   { value = "${module.network.routing_services_range_name}" }
output "services_name"                  { value = "${module.network.routing_name}" }
output "services_name_fancy"            { value = "${module.network.routing_name_fancy}" }
output "services_subnet_id"             { value = "${module.network.routing_subnet_id}" }
