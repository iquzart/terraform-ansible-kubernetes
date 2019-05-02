# Deploy ssh key for instance access
resource "aws_key_pair" "ssh_key" {
  key_name = "ssh_me" 
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
