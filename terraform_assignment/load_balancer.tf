resource "aws_elb" "classic_elb" {
  name            = "c-elb"
  subnets         = [aws_subnet.public.id]
  security_groups = [aws_security_group.alb_sg.id, aws_security_group.instance_sg.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 10
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [aws_instance.instance1.id, aws_instance.instance2.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 300
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "classic-elb"
  }
}