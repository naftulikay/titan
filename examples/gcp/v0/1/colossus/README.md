# Colossus Default Example

A simple Colossus playground for GCP.

This project will launch the following resources:

 - NAT instances for private networking access to WAN (two instances per AZ, typically total of 6 instances).
 - A public GKE cluster for Kubernetes.
 - A bastion host for hopping from WAN to private hosts in the network.
 - Private "admin" instances in the Admin Layer to demonstrate:
   1. that these instances can be reached locally within the network
   2. that these instances can reach WAN via the NAT gateways.

The network namespace that will be created will be `10.0.0.0/15`, first valid IP being `10.0.0.0` and last valid IP being
`10.1.255.255`.

## Getting Started

This repository uses Vagrant for creating a well-defined development environment. `~/.config/gcloud` is mounted as a
shared directory within the VM for access to Google Cloud credentials.

By default, `./startup.sh` creates a user named `naftuli` and grants access to my own personal SSH keys. Modify
`startup.sh` to add your own user and your own SSH keys so that you can move around the network.

> **NOTE**: Make sure you have already logged into the `gcloud` CLI via `gcloud auth login` on your host machine.
> You must also enable some services in your project. This can be automated via the following:
>
> ```
> gcloud services enable dns.googleapis.com \
>   compute.googleapis.com
> ```

Start the VM:

```shell
vagrant up
```

Shell into the VM:

```shell
vagrant ssh
```

Within the VM, export the following environment variables:

```shell
export GOOGLE_PROJECT=my-demo-project \
  GOOGLE_REGION=us-east1 \
  GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/legacy_credentials/naftuli@mydomain.com/adc.json"
```

Generate a plan for this example project:

```shell
make -sC examples/gcp/v0/1/colossus plan
```

Next, spin up the environment:

```shell
make -sC examples/gcp/v0/1/colossus apply
```

Now's a good time to look at all of the outputs, pretty printed in JSON:

```shell
make -sC examples/gcp/v0/1/colossus output
```

When done, tear it all down:

```shell
make -sC examples/gcp/v0/1/colossus destroy
```

Don't forget to destroy everything at the end! Anything you do with your GCP account is on your dime.
