variable "environment" {
  type        = string
  description = "environnement dev,rec,prd aussi utilisé comme préfix aux ressources"
}

variable "region" {
  type        = string
  description = "region où vont etre deployé les ressources aws [eu-west-3 par exemple]"
}

variable "vpc_cidr" {
  type        = string
  description = "Plage d'adressage pour le VPC"
}
variable "public_subnets_cidr" {
  type        = list(string)
  description = "Liste des ip pour le subnet public en fonction des zones"
}
variable "private_subnets_cidr" {
  type        = list(string)
  description = "Liste des ip pour le subnet privé en fonction des zones"
}

variable "availability_zones" {
  type        = list(string)
  description = "Liste des zones de disponibilité"
}


####################"


#App

variable "docker_image" {
  type        = string
  description = "Application docker image"
}

variable "app_container_port" {
  type        = string
  description = "Application exposed port"
}

variable "app_name" {
  type        = string
  description = "Application name"
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
}
variable "lb_tg_proto" {
  type        = string
  description = "Loabalancer Target group protocol"
}

variable "lb_tg_health_check_port" {
  type        = string
  description = "Loabalancer healthcheck port"
  default     = "5000"
}

variable "lb_tg_health_check_matcher" {
  type        = string
  description = "Loabalancer healthcheck matcher"
  default     = "200"
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
  default     = "300"
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