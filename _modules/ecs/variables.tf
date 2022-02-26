
#App
variable "app_container_port" {
  type        = string
  description = "Application exposed port"
}

variable "app_name" {
  type        = string
  description = "Application name"
}

variable "docker_image" {
  type        = string
  description = "Application docker image"
}

variable "environment" {
  type        = string
  description = "AWS Environment"
}


#VPC
variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnets_id" {
  type        = list(any)
  description = "public subnets id list"
}

variable "private_subnets_id" {
  type        = list(any)
  description = "private subnets id list"
}

#ECS
variable "fargate_memory" {
  type        = string
  description = "memory allocation for container"
}

variable "fargate_cpu" {
  type        = string
  description = "cpu allocation for container"
}


#LB
variable "lb_tg_port" {
  type        = string
  description = "Loabalancer Target group port"
  default     = "5000"
}
variable "lb_tg_proto" {
  type        = string
  description = "Loabalancer Target group protocol"
  default     = "HTTP"
}

variable "lb_tg_health_check_port" {
  type        = string
  description = "Loabalancer healthcheck port"
  default     = "80"
}

variable "lb_tg_health_check_proto" {
  type        = string
  description = "Loabalancer healthcheck protocol"
  default     = "HTTP"
}
variable "lb_tg_health_check_treshold" {
  type        = string
  description = "Loabalancer healthcheck Healthy treshold"
  default     = "3"
}

variable "lb_tg_health_check_unhealthy_treshold" {
  type        = string
  description = "Loabalancer healthcheck unhealthy treshold"
  default     = "3"
}

variable "lb_tg_health_check_interval" {
  type        = string
  description = "Loabalancer healthcheck interval"
  default     = "30"
}

variable "lb_tg_health_check_timeout" {
  type        = string
  description = "Loabalancer healthcheck timeout"
  default     = "3"
}

variable "lb_tg_health_check_path" {
  type        = string
  description = "Loabalancer healthcheck path"
  default     = "/"
}
variable "lb_tg_heatlh_check_matcher" {
  type        = string
  description = "Loabalancer healthcheck path"
  default     = "200"
}