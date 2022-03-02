#https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html

# resource "aws_iam_role" "svc" {
#   name = "${var.environment}-${var.app_name}-ecs-role"

#   assume_role_policy = <<EOF
# {
#   "Version": "2008-10-17",
#   "Statement": [
#   {
#     "Sid": "",
#     "Effect": "Allow",
#     "Principal": {
#     "Service": "ecs.amazonaws.com"
#     },
#     "Action": "sts:AssumeRole"
#   }
#   ]
# }
#   EOF
#   }

# resource "aws_iam_role_policy_attachment" "svc" {
#   role       = aws_iam_role.svc.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
# }


resource "aws_iam_role" "ecs_role" {
  name               = "${var.environment}-${var.app_name}-execution-task-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags = {
    Name        = "${var.environment}-${var.app_name}-iam-role"
    Environment = var.environment
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs_role_policy" {
  role       = aws_iam_role.ecs_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}