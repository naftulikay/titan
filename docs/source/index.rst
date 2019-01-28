.. Titan documentation master file, created by
   sphinx-quickstart on Tue Jan 29 00:52:20 2019.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

ᴛɪᴛᴀɴ
=================================

A networking framework well-suited to most organizational needs.

**Table of Contents**

.. toctree::
  :maxdepth: 2

  concepts
..

  **NOTE:** Titan's documentation concerns specifically the *AWS* implementation. `Colossus <https://github.com/naftulikay/colossus>`_
  is the *GCP* implementation and comes with its own set of caveats.
  `See the Colossus documentation for more information. <http://colossus-networking.readthedocs.io/>`_

Titan solves the common organizational problems of network design in a highly configurable and reusable way, solving
the three major problems of *availability*, *scalability*, and *security*:

Availability
    Titan is designed with default support for *three* availability zones in a single region. It is
    easily configurable, supporting one to five availability zones per network.

    When designing infrastructure in concert with Titan with the default setting of three availability zones,
    it is possible to design systems that can tolerate complete outages of *two* of the three availability zones.

Scalability
    Titan is organized into logical *layers*, which each consist of between one and five subnets dedicated to an
    organizational purpose. Each subnet is a ``/23``, allowing ``512`` logical hosts per subnet, with one to five
    subnets per logical layer.

    This design provides ample headroom for growing from very small to very large deployments. In a three AZ setup,
    Titan can host up to ``1,536`` logical hosts per layer, and as there are five layers, this provides room for up
    to ``7,680`` hosts per Titan network. Titan networks are a ``/16`` and the rest of the available space can be
    used.

Security
    Titan's design makes reasoning about network security very simple: there is only one point of ingress and egress
    per network, and the logical grouping of resources makes it easy to structure security groups and network ACLs-
    around these logical groupings.

    Ingress and egress to WAN occurs via the DMZ logical layer, the only set of public subnets. NAT Gateways for
    outbound traffic and public-facing load balancers for ingress all live in the DMZ layer by design.
