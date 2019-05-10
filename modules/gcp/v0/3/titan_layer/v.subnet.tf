# Titan Layer Module - Subnet Variables

variable "layer_index" {
  description = <<-EOF
    The layer index of this layer. Valid values are 0-9 inclusive due to the way container alias ranges work.
  EOF
}
