# Colossus Layer Module

A single layer in a Colossus Network. There are five layers shipped with a Colossus Network:

<dl>
  <dt>DMZ</dt>
  <dd>The only public layer, all ingress and egress happens here.</dd>
  <dt>Routing</dt>
  <dd>Layer 5 and 7 routing resources for routing requests to backend services in the Services Layer.</dd>
  <dt>Services</dt>
  <dd>Backend services and asynchronous workers live here.</dd>
  <dt>Data</dt>
  <dd>Data stores such as RabbitMQ, MySQL, Redis, and Elasticsearch live here.</dd>
  <dt>Admin</dt>
  <dd>Administrative services such as Nagios, Logstash, and etcd live here.</dd>
</dl>

## Resources

### `google_compute_subnetwork.default`

The subnet comprising this layer and its secondary and ternary range for containers and for GKE resources.

#### Resource Outputs

 - `gateway_address`: the gateway address for this subnet.
 - `self_link`: the subnet id.
