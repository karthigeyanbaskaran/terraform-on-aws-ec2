resource "null_resource" "name" {
  depends_on = [module.ec2-instance]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_eip.lb.public_ip
    user        = "ubuntu"
    password    = ""
    private_key = file("karthik.pem")
  }

  provisioner "file" {
    source      = "karthik.pem"
    destination = "/tmp/karthik.pem" #use tmp folder, if you use /opt it will throw permission denined

  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/karthik.pem"
    ]

  }
  provisioner "local-exec" {
    command     = "echo VPC is created at `date` VPC-ID is ${module.vpc.vpc_id} >> log.log"
    working_dir = "logs/"

  }

}
