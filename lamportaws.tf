
/*
    Copyright {2016} {Brian McKean}

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

*/

/*
    Spins up three of the smallest server for use with lamport distributed
    computing project
    This script spins them up in AWS
*/

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}


resource "aws_security_group" "allow_all" {
  name = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  provisioner "local-exec" {
    command = "echo removing previous lamport_ips.txt"
    command = "rm lamport_ips.txt"
  }

}

resource "aws_instance" "lamport1" {
  ami           = "ami-fce3c696"
  instance_type = "t2.micro"
  tags {
        Name = "LamportNode1"
    }
  key_name = "${var.key_name}"
  provisioner "local-exec" {
    command = "echo ${aws_instance.lamport1.public_ip} >> lamport_ips.txt"
    }
  security_groups = ["${aws_security_group.allow_all.name}"]
}

resource "aws_instance" "lamport2" {
  ami           = "ami-fce3c696"
  instance_type = "t2.micro"
  tags {
        Name = "LamportNode2"
    }
  provisioner "local-exec" {
    command = "echo ${aws_instance.lamport2.public_ip} >> lamport_ips.txt"
    }
  security_groups = ["${aws_security_group.allow_all.name}"]
  key_name = "${var.key_name}"
}

resource "aws_instance" "lamport3" {
  ami           = "ami-fce3c696"
  instance_type = "t2.micro"
  tags {
        Name = "LamportNode3"
    }
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.allow_all.name}"]

  provisioner "local-exec" {
    command = "echo ${aws_instance.lamport3.public_ip} >> lamport_ips.txt"
    }
}


