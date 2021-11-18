# Project Todo

## Part 1: Build a Network

### Task \#1: Basic Network Infrastructure

![Desired Network Architecture](https://jacurtis-dropshare.s3-us-west-2.amazonaws.com/Screen-Shot-2021-11-12-21-14-43-u8d2mK.png)

The above outline is the desired structure we are aiming to design our network. The goal is to build a production-quality network with Terraform which matches the architecture outlined in the diagram.

**Variable: Region**
- The Region to put the VPC into. Then we can dynamically grab AZs for that region with a data attribute below.

**Data: Availability Zones**
  - `us-west-1a`
  - `us-west-1b`
  - `us-west-1c`

**1. VPC**
- CIDR: `172.16.0.0/16`
- Region: _from variable:region_
- DNS Hostnames: `Enable`
- DNS Resolution: `Enable`

**2. Public Subnets**
- CIDRs:
  - `172.16.1.0/24`
  - `172.16.2.0/24`
  - `172.16.3.0/24`
- Automatically Assign IPs

**3. App Layer Subnets**
- CIDRs:
  - `172.16.4.0/24`
  - `172.16.5.0/24`
  - `172.16.6.0/24`

**4. DB Layer Subnets**
- CIDRs:
  - `172.16.8.0/24`
  - `172.16.9.0/24`
  - `172.16.10.0/24`

**5. Bastion Security Group**

**6. App Security Group**

**7. Output: VPC ID**


### Task \#2: Routing and Gateways

**1. Create an Internet Gateway**

**2. Create one Elastic IP for each public AZ**

**3. Create a NAT Gateway and associate the EIP with it**

**4. Create a public route and associate it with all three public subnets**

**5. Create three private routes so there is one for each availability zone. Each private route will then be associated with its app and DB subnets accordingly.**

### Task \#3: Bastion Hosts and Testing Connectivity

**1. Create an EC2 instance in each app AZ to act as a Bastion**

**2. Create three bastion hosts**

- Add one in each public AZ
- Allow port 22 access to the Bastions

**3. Allow only Bastions to connect to app instances**

- This will be via a Security Group attached to the app instances that only allow connections from the Bastion SG

**4. Test access manually using SSH**

- Log into Bastion host and then jump to app instance

**5. Test external access from app instances**

- Be able to `ping 1.1.1.1` from the app instance
- Be able to run `sudo yum install` from app instance
