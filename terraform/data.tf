data "aws_ami" "ubuntu-22-04" {
  most_recent = true
  owners = ["099720109477"] # Canonical
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-*-server-*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Fetch AWS Account ID
data "aws_caller_identity" "current" {}

# Output AWS Account ID
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}