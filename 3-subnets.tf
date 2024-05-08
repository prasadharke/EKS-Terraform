data "aws_availability_zones" "available" {}

resource "aws_subnet" "private-subnet-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = data.aws_availability_zones.available.names[0]  # Assign the first AZ from the available list

  tags = {
    "Name"                                      = "private-subnet-a"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "private-subnet-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = data.aws_availability_zones.available.names[1]  # Assign the second AZ from the available list

  tags = {
    "Name"                                      = "private-subnet-b"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public-subnet-a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = data.aws_availability_zones.available.names[0]  # Assign the third AZ from the available list
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-subnet-a"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public-subnet-b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = data.aws_availability_zones.available.names[1]  # Assign the fourth AZ from the available list
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-subnet-b"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

###NEW

