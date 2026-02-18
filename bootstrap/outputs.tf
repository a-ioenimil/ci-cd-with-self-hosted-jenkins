output "s3_state_bucket_name" {
  value = aws_s3_bucket.state_bucket.bucket
}

output "kms_key_arn" {
  value = aws_kms_key.terraform_key.arn
}


