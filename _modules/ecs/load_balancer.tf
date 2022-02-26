resource "aws_lb_target_group" "target_group" {
  name        = "${var.environment}-${var.app_name}-${substr(uuid(), 0, 3)}-tg"
  port        = var.lb_tg_port
  protocol    = var.lb_tg_proto
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = var.lb_tg_health_check_treshold
    interval            = var.lb_tg_health_check_interval
    protocol            = var.lb_tg_health_check_proto
    matcher             = var.lb_tg_heatlh_check_matcher
    port                = var.lb_tg_health_check_port
    timeout             = var.lb_tg_health_check_timeout
    path                = var.lb_tg_health_check_path
    unhealthy_threshold = var.lb_tg_health_check_unhealthy_treshold
  }

  tags = {
    Name        = "${var.environment}-tg"
    Environment = var.environment
  }

    lifecycle {
      create_before_destroy = true
      ignore_changes        = [name]
    }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.application_load_balancer.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.id
  }
    depends_on = [aws_lb_target_group.target_group]
}