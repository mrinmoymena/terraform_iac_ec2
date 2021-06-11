resource "aws_instance" "ec2_public" {
  ami                         = var.ami # ap-sounth-1
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_pair
  security_groups             = [aws_security_group.ec2_infra_sg_public.id]
  subnet_id                   = aws_subnet.ec2_infra_sn_public.id
  #user_data = file(“./install_jenkins.sh”)
  user_data = <<-EOL
              #!/bin/bash -xe
              wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
              sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ >> /etc/apt/sources.list.d/jenkins.list'
              sudo apt update -y > /tmp/aptupdate.out
              sudo apt install openjdk-11-jdk -y > /tmp/install_jdk.out
              sudo apt install jenkins -y > /tmp/install_jenkins.out
              sudo systemctl start jenkins > /tmp/start_jenkins.out
              sudo apt install python3-pip -y > /tmp/install_pip3.out
              sudo pip3 install ansible > /tmp/install_ansible.out
              sudo pip3 install paramiko > /tmp/install_paramiko.out
              sudo cat /var/lib/jenkins/secrets/initialAdminPassword
              sudo apt install maven -y > /tmp/install_maven.out
              EOL
  tags = {
    Name = "ec2_jenkins"
  }
}
resource "aws_instance" "ec2_private" {
  ami                         = "ami-0c1a7f89451184c8b" # ap-sounth-1
  instance_type               = "t2.micro"
  key_name                    = var.key_pair
  security_groups             = [aws_security_group.ec2_infra_sg_private.id]
  subnet_id                   = aws_subnet.ec2_infra_sn_private.id
  user_data = <<-EOL
              #!/bin/bash -xe
              sudo apt-get update -y > /tmp/aptupdate.out
              sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y > /tmp/prereq_install.out
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
              echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable' | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
              sudo apt-get update -y >> /tmp/aptupdate.out
              sudo apt-get install docker-ce docker-ce-cli containerd.io -y > /tmp/install_docker.out
              EOL
  tags = {
    Name = "ec2_client"
  }
}

