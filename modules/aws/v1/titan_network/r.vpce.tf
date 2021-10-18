# Titan Network Module - VPC Endpoint Resourcees

resource aws_vpc_endpoint s3 {
  vpc_id = aws_vpc.default.id
  service_name = data.aws_vpc_endpoint_service.s3.service_name

  route_table_ids = concat(
    module.dmz_layer.route_table_ids,
    module.routing_layer.route_table_ids,
    module.service_layer.route_table_ids,
    module.data_layer.route_table_ids,
    module.admin_layer.route_table_ids,
    module.net_layer.route_table_ids
  )
}
