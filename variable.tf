variable "region" {
    default = "us-west-2"
}
variable "def-vpc" {
    cidr_block = "10.0.0.0/16"
}
variable "PUB-subnet1" {
    cidr_block = "10.0.0.0/24"
}
variable "PUB-subnet2" {
    cidr_block = "10.0.0.1/24"
}
variable "PRIV-subnet1" {
    cidr_block = "10.0.0.2/24"
}
variable "PRIV-subnet2" {
    cidr_block = "10.0.0.3/24"
}
