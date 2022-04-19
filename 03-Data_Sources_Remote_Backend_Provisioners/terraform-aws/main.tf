#Purpose of the this hands-on training is to give students the knowledge of terraform data sources, remote backend and provisioners in Terraform.

# - Use terraform data sources.
# - Create a remote backend.
# - Use terraform provisioners.

data "aws_ami" "tf_ami" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "tf-ec2" {
  ami           = data.aws_ami.tf_ami.id
  instance_type = var.ec2-type
  key_name      = "mk"
  tags = {
    Name = "${local.mytag}-this is from my-ami"
  }
}


