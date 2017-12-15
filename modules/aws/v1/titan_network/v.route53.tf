# TITAN Network Module - Route 53 Variables

variable "domain" {
  description = <<-EOF
    The base domain to derive network hosted zones from.

    Usually, this value is set to something like `mydomain.com`, yielding hosted zones for environments like
    `dev.mydomain.com`, `stg.mydomain.com`, and `prod.mydomain.com`.

    Examples: `mydomain.com`, `mycompanydomain.com`, `uswest1.mydomain.com`. 
  EOF
}
