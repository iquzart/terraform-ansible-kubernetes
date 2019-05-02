# Set up kubectl on localhost
resource "null_resource" "kubectl" {
  provisioner "local-exec" {
   command = "curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl; chmod u+x kubectl"
  }
  depends_on = ["aws_instance.k8s-single-node"]
}

resource "null_resource" "kubectl_config" {
  provisioner "local-exec" {
   command = "./kubectl config --kubeconfig kube-config set clusters.kubernetes.server https://${aws_instance.k8s-single-node.public_ip}:6443"
  }
  depends_on = ["null_resource.kubectl"]
}

resource "null_resource" "kubectl_test_connection" {
  provisioner "local-exec" {
   command = "sleep 60; ./kubectl  --kubeconfig kube-config get all -n kube-system"
  }
  depends_on = ["null_resource.kubectl_config"]
}

