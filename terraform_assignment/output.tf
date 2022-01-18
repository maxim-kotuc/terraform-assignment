output "clb-dns" {
  value = aws_elb.classic_elb.dns_name
}