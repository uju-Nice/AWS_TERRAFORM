
resource "aws_instance" "nickos_server" {
  count = 2 # create four similar EC2 instances
  ami           = var.ami # get this from the console
  instance_type = var.instance_type # get this from the console

  tags = {
    Name = "Nickos-Server ${count.index}"
  }
    user_data = <<-EOF
    #!/bin/bash 
   sudo apt install -y http  && apt update 
   sudo systemctl enable http && systemctl start http
    sudo systemctl status http
    sudo chown -R $USER:$USER /var/www/html
    sudo echo "<html><body><h1> Welcome to Devops world" </h1></body></html>  >>  /var/www/html/index.html
 EOF
}

# module "ec2_servers" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "4.3.0"
#   ami     = var.ami
#   instance_type = var.instance_type

#   tags = {
#     Environment = "dev"
#   }
# }