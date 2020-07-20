provider "aws" {
  profile    = "default"
  region     = var.region
}

resource "aws_instance" "example" {
  ami           = "ami-0b1e2eeb33ce3d66f"
  instance_type = "t2.micro"
}
