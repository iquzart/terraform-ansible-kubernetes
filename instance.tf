# Provision a instance using the latest Ubuntu 18.04 on a
# t2.micro node to setup single node Kubernetes Cluster

resource "aws_instance" "k8s-single-node" {
  ami             = "${var.ami}"
  vpc_security_group_ids = ["${aws_security_group.k8s-sg.id}"]
  instance_type   = "${var.instance_type}"
  key_name        = "${var.ssh_key_pair}"
  tags {
    Name = "k8s-single-node"
  }

 connection {
  user         = "${var.ssh_user}"
  private_key  = "${file("~/.ssh/id_rsa")}"
  }

 provisioner "remote-exec" {
  inline = [
    "sudo apt update",
    "sudo apt install python-minimal python-apt -y"
    ]
  }


 provisioner "local-exec" {
  command = "ansible-playbook -u ${var.ssh_user} --private-key ~/.ssh/id_rsa   -i '${aws_instance.k8s-single-node.public_ip},' ansible/init.yml" 
 }
}

