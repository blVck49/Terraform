resource "aws_vpc" "def-vpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "def-vpc"
    }
}
resource "aws_subnet" "PUB-subnet1"{
    vpc_id = "${aws_vpc_def-vpc.id}"
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "PUB-subnet1"
    }
}
resource "aws_subnet" "PUB-subnet2"{
    vpc_id = "${aws_vpc_def-vpc.id}"
    cidr_block = "10.0.0.1/24"
    tags = {
        Name = "PUB-subnet2"
    }
}
resource "aws_subnet" "PRIV-subnet1"{
    vpc_id = "${aws_vpc_def-vpc.id}"
    cidr_block = "10.0.0.2/24"
    tags = {
        Name = "PRIV-subnet1"
    }
}
resource "aws_subnet" "PRIV-subnet2"{
    vpc_id = "${aws_vpc_def-vpc.id}"
    cidr_block = "10.0.0.3/24"
    tags = {
        Name = "PRIV-subnet2"
    }
}
resource "aws_internet_gateway" "IGW"{
    vpc_id = "${aws_vpc_def-vpc.id}"
    tags = {
        Name = "IGW"
    }
}
resource "aws_network_interface" "one"{
    vpc = true
    subnet_id = "${aws_subnet.PUB-subnet1.id}"
    associate_with_private_ip = "10.0.0.10/24"
}
resource "aws_network_interface" "two"{
    vpc = true
    subnet_id = "${aws_subnet.PUB-subnet2.id}"
    associate_with_private_ip = "10.0.0.11/24"
}
resource "aws_nat_gateway" "Nat_GW1"{
    allocation_id = "${aws_eip.nat.id}"
    subnet_id = "${aws_subnet.PUB-subnet1.id}"
}
resource "aws_nat_gateway" "Nat_GW2"{
    allocation_id = "${aws_eip.nat.id}"
    subnet_id = "${aws_subnet.PUB-subnet2.id}"
}
resource "aws_route_table" "r1"{
    vpc_id = "${aws_vpc.def-vpc.id}"
    route {
        cidr_block = "10.0.0.0/24"
        gateway_id = "${aws_internet_gateway.IGW.id}"
        tags = {
            Name = "r1"
        }
    }
}
resource "aws_route_table" "r2"{
    vpc_id = "${aws_vpc.def-vpc.id}"
    route {
        cidr_block = "10.0.0.1/24"
        gateway_id = "${aws_internet_gateway.IGW.id}"
        tags = {
            Name = "r2"
        }
    }
}
resource "aws_route_table" "r3"{
    vpc_id = "${aws_vpc.def-vpc.id}"
    route {
        cidr_block = "10.0.0.2/24"
        gateway_id = "${aws_nat_gateway.Nat_GW1}"
        tags = {
            Name = "r3"
        }
    }
}
resource "aws_route_table" "r4"{
    vpc_id = "${aws_vpc.def-vpc.id}"
    route {
        cidr_block = "10.0.0.3/24"
        gateway_id = "${aws_nat_gateway.Nat_GW2}"
        tags = {
            Name = "r4"
        }
    }

}

