resource "aws_instance" "nickos-ec2" {
    instance_type = var.instance_type
    ami = var.ami
     user_data = <<-EOF
              #!/bin/bash
              yum update -y
              sudo apt update -y
              sudo apt install -y wget
              echo "wget package installed successfully!" > /home/ec2-user/wget-installed.log
            EOF

      tags = {
            Name = "nickos-web-server"     
}
}

resource "aws_security_group" "nickos-ssh" {
    name = "allow_ssh"
    description = "Allow SSH inbound traffic/or from a trusted IP"
    vpc_id = var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.security_group
    }

     egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var_ecurity_group
  }

    tags = {
        Name = "allow_ssh"
    }

}

