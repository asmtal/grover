resource "aws_ecs_cluster" "aws-ecs-cluster" {
  name = "${var.environment}-${var.app_name}-cluster"
  tags = {
    Name        = "${var.environment}-${var.app_name}-ecs"
    Environment = var.environment
  }
}