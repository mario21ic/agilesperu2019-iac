provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "web" {
  ami = "ami-06f2f779464715dc5" 
  instance_type = "t2.micro" 
  key_name = "agiles2019"
  tags = { 
    Name = "HelloWorld" 
  }
  connection {
      user = "ubuntu"
      type = "ssh"
      private_key = "${file("agiles2019.pem")}"
      timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
    ]
  }
}
