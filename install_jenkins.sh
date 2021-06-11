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
sudo apt install maven > /tmp/install_maven.out
