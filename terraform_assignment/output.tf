#Gives us the public DNS of the load balancer as we don't have 
#a route 53 registered domain
output "clb-dns" {
  value = aws_elb.classic_elb.dns_name
}