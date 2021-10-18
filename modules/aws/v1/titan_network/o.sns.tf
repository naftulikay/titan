# Titan Network Module - SNS Outputs

output autoscaling_sns_topic_arn {
  value = aws_sns_topic.autoscaling.arn

  description = <<-EOF
    ARN of the SNS autoscaling topic.

    This SNS topic is intended to be attached to autoscaling groups in this Titan network in order to provide a
    centralized notification topic which is notified when servers are added and removed from autoscaling groups.
  EOF
}
