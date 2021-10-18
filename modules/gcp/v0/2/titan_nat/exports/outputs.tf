# Titan NAT Module Template Outputs File for Projects

output nat_additional_instance_labels { value = "${module.nat.additional_instance_labels}" }
output nat_additional_instance_tags { value = ["${module.nat.additional_instance_tags}"] }
output nat_additional_private_routing_tags { value = ["${module.nat.additional_private_routing_tags}"] }
output nat_additional_ssh_cidr_blocks { value = ["${module.nat.additional_ssh_cidr_blocks}"] }
output nat_additional_startup_script { value = "${module.nat.additional_startup_script}" }
output nat_allow_local_ssh_access { value = "${module.nat.allow_local_ssh_access}" }
output nat_autohealing_initial_delay { value = "${module.nat.autohealing_initial_delay}" }
output nat_availability_zones { value = ["${module.nat.availability_zones}"] }
output nat_dmz_cidr_blocks { value = ["${module.nat.dmz_cidr_blocks}"] }
output nat_dmz_subnet_ids { value = ["${module.nat.dmz_subnet_ids}"] }
output nat_healthcheck_firewall_id { value = "${module.nat.healthcheck_firewall_id}" }
output nat_healthcheck_healthy_threshold { value = "${module.nat.healthcheck_healthy_threshold}" }
output nat_healthcheck_id { value = "${module.nat.healthcheck_id}" }
output nat_healthcheck_interval { value = "${module.nat.healthcheck_interval}" }
output nat_healthcheck_path { value = "${module.nat.healthcheck_path}" }
output nat_healthcheck_port { value = "${module.nat.healthcheck_port}" }
output nat_healthcheck_timeout { value = "${module.nat.healthcheck_timeout}" }
output nat_healthcheck_unhealthy_threshold { value = "${module.nat.healthcheck_unhealthy_threshold}" }
output nat_instance_boot_disk_size { value = "${module.nat.instance_boot_disk_size}" }
output nat_instance_boot_disk_type { value = "${module.nat.instance_boot_disk_type}" }
output nat_instance_image { value = "${module.nat.instance_image}" }
output nat_instance_labels { value = "${module.nat.instance_labels}" }
output nat_instance_metadata { value = "${module.nat.instance_metadata}" }
output nat_instance_service_account { value = "${module.nat.instance_service_account}" }
output nat_instance_tags { value = "${module.nat.instance_tags}" }
output nat_instance_template_ids { value = ["${module.nat.instance_template_ids}"] }
output nat_instance_type { value = "${module.nat.instance_type}" }
output nat_joined_instance_labels { value = "${module.nat.joined_instance_labels}" }
output nat_joined_instance_metadata { value = "${module.nat.joined_instance_metadata}" }
output nat_joined_instance_tags { value = "${module.nat.joined_instance_tags}" }
output nat_joined_private_routing_tags { value = ["${module.nat.joined_private_routing_tags}"] }
output nat_max_availability_zones { value = "${module.nat.max_availability_zones}" }
output nat_network_cidr_block { value = "${module.nat.network_cidr_block}" }
output nat_network_id { value = "${module.nat.network_id}" }
output nat_primary_external_ip_ids { value = ["${module.nat.primary_external_ip_ids}"] }
output nat_primary_external_ips { value = ["${module.nat.primary_external_ips}"] }
output nat_primary_instance_group_ids { value = ["${module.nat.primary_instance_group_ids}"] }
output nat_primary_instance_group_manager_ids { value = ["${module.nat.primary_instance_group_manager_ids}"] }
output nat_primary_internal_ip_ids { value = ["${module.nat.primary_internal_ip_ids}"] }
output nat_primary_internal_ips { value = ["${module.nat.primary_internal_ips}"] }
output nat_private_route_ids { value = ["${module.nat.private_route_ids}"] }
output nat_private_route_priority { value = "${module.nat.private_route_priority}" }
output nat_private_routing_tags { value = ["${module.nat.private_routing_tags}"] }
output nat_region { value = "${module.nat.region}" }
output nat_ssh_firewall_id { value = "${module.nat.ssh_firewall_id}" }
output nat_ssh_source_tags { value = "${module.nat.ssh_source_tags}" }
output nat_startup_script { value = "${module.nat.startup_script}" }
output nat_startup_script_template { value = "${module.nat.startup_script_template}" }
output nat_startup_script_template_actual { value = "${module.nat.startup_script_template_actual}" }
output nat_summary_firewall_id { value = "${module.nat.summary_firewall_id}" }
output nat_vpc_id { value = "${module.nat.vpc_id}" }
