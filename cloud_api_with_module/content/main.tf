provider "aws" {
    access_key = "${var.AWS_ACCESS_KEY_ID}"
    secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
    token = "${var.AWS_SESSION_TOKEN}"
#   access_key="ASIA3RFXFS3BPRKR33MU"
#   secret_key="AmkVFRM5o70936v9VK4BzHOXXhDiVzzbDmz0hS++"
#   token="IQoJb3JpZ2luX2VjEB4aDmFwLXNvdXRoZWFzdC0xIkcwRQIgGMvConCNvt9ABpJGYfgrwxX++DZ8jmWedWhYcFziwUoCIQDOm2Mt6uO/a/mvI34RaXUy5lvGbg8w+Wno6WqBlsKLgyq3Awi3//////////8BEAAaDDc5MjgwNTYxMTIwMiIMdd30zS4URraNPLWDKosDOAOTFqbBb0vHqjGY1BqYJBlweV+yKa+aJEcu9vYe9Rkyvw6I9UDEnMnEFMgNZ/Lnu3uK/UTOYoxHlC4rRwJSrtYRdAsJac4BWgEMaJgpHQzz51q2vqXEfGt9reIQzfFlccNprLODbd4bBTigUxNAG7OFIVOMIXEVbomqridDOLSSnFoX+guoOmlaIG5bxZe006J/htTE73mhs5rP7xqO6BuxTN1CHq9h/yPL11nfhVoE+7WkxQ1LmOXng0iZCIFYXn/DHb7GNYmyMzzJCcDWNnxg1JBgsziWwUaGXLfa0aSpZdraGoYGp4jHA3CivSvH+GxgaZtz7tYPfoUYX19GWJeRwQrFY4IEfFY00X6Kqr7iIszdLahwMXd3o0ASUq8LQi4GyU7tTDE+YUblYEIiRZNqsOvciWR8JmGisWV3kSf+JE7sQI9cMsQM/bDmnjPxKUekXWSc3g0rEFDK/oNXPdFcyAPEeNbTXXiQ5vEJOY4iC+2X7MeFBTK91NMSlE+x3O0gQlSaWN5TXlgw9YTprAY6pgF6mwZfF7tAjVZnYUM6CDYU2VTDNHJUBi9VaZJm8DUOZ6AjDeEppDKeoiosTh5+zqEbflyIiv7ldd5FDckz01CrB+lvpmZCPqf+Hx12HbSlwyggJfMJDhu2pvbwbKP85n5DQ4Qm7s4AXKDXA0TddPpCbhjbhA9hei77vl+rYc0i4shGVcUv1ISMkeBMQnTVSct2hpyEoD/t/3ruXc8zdVYX9oq4K2Wj"

    region = "ap-southeast-1"
     
}
 
module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
 
  name = "xiaojun-api-create-00"
 
  instance_type          = "t2.micro"
  ami = "ami-0e4b5d31e60aa0acd"
 
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["one", "two"])

  name = "xiaojun-api-create-instance-${each.key}"

  instance_type          = "t2.micro"
  ami = "ami-0e4b5d31e60aa0acd"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}  

module "ec2_instance_tenant01" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["three", "four"])

  name = "xiaojun-api-create-instance-${each.key}"

  instance_type          = "t2.micro"
  ami = "ami-0e4b5d31e60aa0acd"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
