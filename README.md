# Terraform home assignment
Simple terraform assignment to create an aws infraststructure using the amazon aws free tier.
## Task
Create a vpc with a single private and a single public subnet within it. Launch 2 EC2 instances running nginx docker container in the private subnet and make them accessible from the internet using a load balancer residing in the public subnet.
## Requirements
| Name | Version |
|------|---------|
| Terraform | 1.1.3 |
| aws-cli (for authentication) | 2.4.9 |
## Providers
| Name | Version |
|------|---------|
| aws | 3.0 |
## Variables
| Name | Descripton | Type | Default | Required |
|------|------------|------|---------|----------|
| az | Availability zone to deploy subnets in | `string` | n/a | yes |
| region | Region to deploy in | `string` | n/a | yes |
| instance_type | Type of EC2 instance to launch | `string` | n/a | yes |
| key_name | Name of key file to ssh to instances | `string` | n/a | yes |
## Output
| Name | Description |
|------|-------------|
| clb-dns | Public DNS of the classic load balancer. |
