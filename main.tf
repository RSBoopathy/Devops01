resource "aws_eks_cluster" "" {
  name     = ""
  role_arn = ""
  vpc_config {
    subnet_ids = []
  }
}

resource "aws_chime_voice_connector" "" {
  name               = ""
  require_encryption = false
}

resource "aws_ami" "" {
  name = ""
}


resource "aci_aaa_domain" "" {
  name = ""
}