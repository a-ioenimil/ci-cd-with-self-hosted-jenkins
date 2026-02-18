resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_kms_key" "terraform_key" {
  description             = "KMS key for Terraform state"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}

resource "aws_kms_alias" "key_alias" {
  name          = "alias/terraform-bootstrap-key"
  target_key_id = aws_kms_key.terraform_key.key_id
}

resource "aws_s3_bucket" "state_bucket" {
  bucket = "ci-cd-jenkins-lab-bucket-${random_id.bucket_suffix.hex}"
}

resource "aws_s3_bucket_versioning" "ver" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration { status = "Enabled" }
}


