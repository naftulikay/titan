# ᴛɪᴛᴀɴ :rocket: [![Build Status][travis.svg]][travis]

A network layout well-suited to most organizational needs.

## Sales pitch

### Narrative

The network framework POC was built to accomplish the following goals most organizations need.

1. *Availability:* Designed to survive up to 2/3 AZs going down at once in a region
2. *Scalability:* Large network namespace to account for huge deployments
3. *Security:* Only one way in and out via a DMZ subnet, network ACLs between subnets aka layers, firewall rules for different logical types of infrastructure
4. *Segregation:* Services are arranged logically in a series of five subnets;
    1. DMZ (public resources such as load balancers)
    2. Routing (NGINX/HAProxy/layer 7 routing rules)
    3. Services (for backend web services, async workers, and ETL jobs)
    4. Data (for databases: e.g. Postgres, RabbitMQ, Elasticsearch, basically things that are stateful)
    5. Admin (for administrative services like ZooKeeper and etcd and logstash and nagios and whatever)


### Rationale/Justification:

This network framework is known as Titan and has been deployed for large enterprise customers. Rather than building a network from scratch, this network framework can be used to provide a highly-available, secure, and scalable network foundation.

## Authors

Authors and contributors listed in [`./AUTHORS.md`][authors].

Original complete network design by [@lordnynex][lordnynex], implementation and extended by [@naftulikay][naftulikay].

## License

 * [Apache License, Version 2.0][license-apache]: [`./LICENSE-APACHE`][license-apache-local]
 * [MIT License][license-mit]: [`./LICENSE-MIT`][license-mit-local]


Licensed at your option of either of the above licenses.

## Dedication

Dedicated to the crew of the U.S.S. Gloria and in loving memory of Lieutenant Hoerig.  
Independence Day, Second of May, we will never forget.

---

![Blessed Status][blessed.svg] [![Sun Status][sun.svg] :raised_hands: :sun_with_face:][sun]

 [travis]: https://travis-ci.org/naftulikay/titan
 [travis.svg]: https://travis-ci.org/naftulikay/titan.svg
 [blessed.svg]: site/naftuli-blessed.svg
 [sun]: https://imgur.com/a/xjLKd
 [sun.svg]: site/sun-praised.svg
 [lordnynex]: https://github.com/lordnynex
 [naftulikay]: https://github.com/naftulikay
 [license-mit]: https://opensource.org/licenses/MIT
 [license-mit-local]: LICENSE-MIT
 [license-apache]: https://www.apache.org/licenses/LICENSE-2.0
 [license-apache-local]: LICENSE-APACHE
 [authors]: AUTHORS.md
