output "Instace Public IP" {
  description = "Public IP of instance"
  value       = "${aws_instance.k8s-single-node.public_ip}"
}

output "Instace Private IP" {
  description = "Private IP of instance"
  value       = "${aws_instance.k8s-single-node.private_ip}"
}

output "Instace Private DNS" {
  description = "Private DNS of instance"
  value       = "${aws_instance.k8s-single-node.private_dns}"
}

output " Instace Public DNS" {
  description = "Public DNS of instance (or DNS of EIP)"
  value       = "${aws_instance.k8s-single-node.public_dns}"
}


output "Instace SSH key pair" {
  description = "Name of the SSH key pair provisioned on the instance"
  value       = "${aws_instance.k8s-single-node.key_name}"
}



output "Notes"  {
   description = "A Note to access the kubernetes cluster from localhost"
   value       = <<NOTE
   
   ###########################################################################
   ##################### Access the cluster using below ######################
   #                                                                         #
   #         ./kubectl --kubeconfig kube-config get componentstatus          #
   #                                                                         #
   ###########################################################################
NOTE
}

