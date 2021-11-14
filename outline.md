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