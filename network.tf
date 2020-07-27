provider "aws" {
    profile = "default"
    region = "${var.region}"
}

resource "aws_vpc" "PROD-vpc" {
    cidr_block = "${var.PROD-vpc}"
    tags = {
        Name = "PROD-vpc"
    }
}
resource "aws_subnet" "PUB-subnet1" {
    vpc_id = "${aws_vpc.PROD-vpc.id}"
    cidr_block = "${var.PUB-subnet1}"
    tags = {
        Name = "PUB-subnet1"
    }
}
resource "aws_subnet" "PUB-subnet2"{
    vpc_id = "${aws_vpc.PROD-vpc.id}"
    cidr_block = "${var.PUB-subnet2}"
    tags = {
        Name = "PUB-subnet2"
    }
}
resource "aws_subnet" "PRIV-subnet1"{
    vpc_id = "${aws_vpc.PROD-vpc.id}"
    cidr_block = "${var.PRIV-subnet1}"
    tags = {
        Name = "PRIV-subnet1"
    }
}
resource "aws_subnet" "PRIV-subnet2"{
    vpc_id = "${aws_vpc.PROD-vpc.id}"
    cidr_block = "${var.PRIV-subnet2}"
    tags = {
        Name = "PRIV-subnet2"
    }
}
resource "aws_internet_gateway" "IGW"{
    vpc_id = "${aws_vpc.PROD-vpc.id}"
    tags = {
        Name = "IGW"
    }
}
resource "aws_route_table" "r1"{
    vpc_id = "${aws_vpc.PROD-vpc.id}"
    route {
        cidr_block = "${var.PUB-subnet1}"
    }
}
resource "aws_route_table" "r2"{
    vpc_id = "${aws_vpc.PROD-vpc.id}"
    route {
        cidr_block = "${var.PUB-subnet2}"
    }
}
resource "aws_route_table" "r3"{
    vpc_id = "${aws_vpc.PROD-vpc.id}"
    route {
        cidr_block = "${var.PRIV-subnet1}"
    }
}
resource "aws_route_table" "r4"{
    vpc_id = "${aws_vpc.PROD-vpc.id}"
    route {
        cidr_block = "${var.PRIV-subnet2}"
    }
}

