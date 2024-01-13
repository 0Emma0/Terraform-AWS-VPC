# Terraform-AWS-VPC
In this example we will create the following resourses on AWS using Terraform. 

## Virtual Private Cloud (VPC) and Subnets
A virtual private cloud (VPC) is a virtual network dedicated to your AWS account. It is logically isolated from other virtual networks in the AWS Cloud. You can specify an IP address range for the VPC, add subnets, add gateways, and associate security groups.

A subnet is a range of IP addresses in your VPC. You launch AWS resources, such as Amazon EC2 instances, into your subnets. You can connect a subnet to the internet, other VPCs, and your own data centers, and route traffic to and from your subnets using route tables.

### VPC CIDR blocks
https://docs.aws.amazon.com/vpc/latest/userguide/vpc-cidr-blocks.html 

## Security Group
A security group controls the traffic that is allowed to reach and leave the resources that it is associated with. For example, after you associate a security group with an EC2 instance, it controls the inbound and outbound traffic for the instance.

When you create a VPC, it comes with a default security group. You can create additional security groups for a VPC, each with their own inbound and outbound rules. You can specify the source, port range, and protocol for each inbound rule. You can specify the destination, port range, and protocol for each outbound rule.

## Internet Gateway
You control how the instances that you launch into a VPC access resources outside the VPC.

A default VPC includes an internet gateway, and each default subnet is a public subnet. Each instance that you launch into a default subnet has a private IPv4 address and a public IPv4 address. These instances can communicate with the internet through the internet gateway. An internet gateway enables your instances to connect to the internet through the Amazon EC2 network edge.

By default, each instance that you launch into a nondefault subnet has a private IPv4 address, but no public IPv4 address, unless you specifically assign one at launch, or you modify the subnet's public IP address attribute. These instances can communicate with each other, but can't access the internet.

You can enable internet access for an instance launched into a nondefault subnet by attaching an internet gateway to its VPC (if its VPC is not a default VPC) and associating an Elastic IP address with the instance.

When you create an Internet Gateway, you will need to define a route table defining the cidr block which will determine where the network traffic will be routed. And another resource to associate this route table with the Subnet. 

Alternatively, to allow an instance in your VPC to initiate outbound connections to the internet but prevent unsolicited inbound connections from the internet, you can use a network address translation (NAT) device. NAT maps multiple private IPv4 addresses to a single public IPv4 address. You can configure the NAT device with an Elastic IP address and connect it to the internet through an internet gateway. This makes it possible for an instance in a private subnet to connect to the internet through the NAT device, routing traffic from the instance to the internet gateway and any responses to the instance.

If you associate an IPv6 CIDR block with your VPC and assign IPv6 addresses to your instances, instances can connect to the internet over IPv6 through an internet gateway. Alternatively, instances can initiate outbound connections to the internet over IPv6 using an egress-only internet gateway. IPv6 traffic is separate from IPv4 traffic; your route tables must include separate routes for IPv6 traffic.

### Difference between IGW vs NAT GW
| Internet Gateway | NAT Gateway |
| --- | --- |
| Connects a VPC to the internet | Enables outbound traffic from a private subnet to the internet |
| Acts as a virtual router between a VPC and the internet | Translates private IP addresses of instances to public IP addresses |
| Required for resources within a VPC to be accessible from the internet | Used when resources within a private subnet require internet access but should not be directly accessible from the internet |
| Instances within a public subnet must have public IP addresses to communicate with the internet | Instances within a private subnet can have private IP addresses |
| Used for hosting publicly accessible resources like web servers | Used for instances that need to access the internet for updates or data retrieval |
| Traffic is routed directly to the internet | Traffic is routed through the NAT Gateway before going to the internet |
| Can be attached to only one VPC	| Can be shared across multiple VPCs |
| Does not modify the source IP address | Replaces the source IP address with its own IP address |
| It is typically used in corporate networks, where it serves as the default gateway for devices in the network. | A NAT gateway is typically used in smaller networks, such as home networks, where it is used to share a single internet connection between multiple devices. |
| Internet Gateway serves as a point of entry and exit for network traffic between a private network and the internet | NAT Gateway is used to translate private IP addresses into public IP addresses and vice versa |

## Terraform code execution
If you don't have the knowledge to create resources on AWS using Terraform, follow these instructions to have prerequisites in place, then run the Terraform commands: https://github.com/0Emma0/Terraform-AWS-EC2 
