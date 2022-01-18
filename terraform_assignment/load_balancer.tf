#Here I had to use the classic load balancer as the newer application one doesn't allow allocation of only
#one subnet in only one az. It is internet-facing by default.
resource "aws_elb" "classic_elb" {
  name            = "c-elb"
  subnets         = [aws_subnet.public.id]
  security_groups = [aws_security_group.alb_sg.id, aws_security_group.instance_sg.id]

#Single listener checking for incoming HTTP requests on port 80 and redirecting them to EC2 instances
#on the same port
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

#Health check with default settings, nothing special here
  health_check {
    healthy_threshold   = 10
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

#Here we target our EC2 instances, since we are deployed in only one az, enabling
#cross zone load balancing is pointless
  instances                   = [aws_instance.instance1.id, aws_instance.instance2.id]
  cross_zone_load_balancing   = false
  idle_timeout                = 300
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "classic-elb"
  }
}