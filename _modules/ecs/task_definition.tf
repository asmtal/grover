resource "aws_ecs_task_definition" "aws-ecs-task" {
  family = "${var.app_name}-task"

  container_definitions = <<TASK_DEFINITION
  [
    {
      "name": "${var.environment}-${var.app_name}-container",
      "image": "${var.docker_image}",
      "entryPoint": [],
      "essential": true,
      "environment": [
        {"name": "ENVIRONMENT", "value": "${var.environment}"}
      ],
      "portMappings": [
        {
          "containerPort": ${var.app_container_port},
          "hostPort": ${var.app_container_port}
        }
      ],
      "cpu": ${var.fargate_cpu},
      "memory": ${var.fargate_memory},
      "networkMode": "awsvpc"
    }
  ]
  TASK_DEFINITION

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = var.fargate_memory
  cpu                      = var.fargate_cpu
  execution_role_arn       = var.iam_role
  task_role_arn            = var.iam_role

  tags = {
    Name        = "${var.environment}-${var.app_name}-ecs-task"
    Environment = var.environment
  }
}

data "aws_ecs_task_definition" "main" {
  task_definition = aws_ecs_task_definition.aws-ecs-task.family
}

