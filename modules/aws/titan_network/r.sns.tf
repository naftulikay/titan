# TITAN Network Module - SNS Resources

# SNS Topic for Network AutoScaling Events
resource "aws_sns_topic" "autoscaling" {
  name = "titan_${var.name_short}_autoscaling_topic"
  display_name = "SNS Notification Topic for Auto-Scaling Events in the ${var.name_fancy}."
}
