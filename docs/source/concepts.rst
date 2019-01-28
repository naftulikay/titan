Concepts in Titan
=================

Titan is a collection of logical concepts which will be explained presently.

.. toctree::
   :maxdepth: 2

  concepts/layer
  concepts/network
  concepts/hub
  concepts/environment

Layers
    A Titan *Layer* is a group of subnets, route tables, network ACLs, and other relevant resources all allocated for
    a single logical purpose. There are five default Titan Layers included in every Titan Network.

    It is possible to add additional arbitrary Titan Layers to a given Titan Network.

Networks
    A Titan *Network* is a collection of the five layers described above as well as the higher level networking
    resources (such as the VPC, DNS via Route 53, etc.) to bind them all together.

Hubs
  A Titan *Hub* is a Titan Network which is suited to serve as a hub in a hub-spoke network layout. More information
  and use-cases will be provided in the relevant documentation.

  Generally, multiple Titan *Environments* will use VPC Peering back to one Titan *Hub* to share resources and to
  centralize services like logging and metrics collection. A VPN Connection is optionally provided to link a Hub
  network back to physical, on-premises resources such as an office network or a data-center.

Environments
  A Titan *Environment* is a Titan Network which forms a spoke from a given Titan Hub network.

  Typical use-cases for Titan Environments are for providing development, staging, production, and data-science
  environments all linked back to a single Hub network for common, shared resources.
