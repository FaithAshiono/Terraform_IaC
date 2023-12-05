

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

# Define variables
#variable "initials" {
#  default = "JS"
#}

# Create S3 bucket for AdventureTech
resource "aws_s3_bucket" "adventure_bucket" {
  bucket = "adventuretech-bucket"
  }

resource "aws_s3_bucket_ownership_controls" "adventure_bucket" {
  bucket = aws_s3_bucket.adventure_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "adventure_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.adventure_bucket]

  bucket = aws_s3_bucket.adventure_bucket.id
  acl    = "private"
}



# Create S3 bucket for NatureEscape
resource "aws_s3_bucket" "nature_bucket" {
  bucket = "natureescape-bucket"
  }

resource "aws_s3_bucket_ownership_controls" "nature_bucket" {
  bucket = aws_s3_bucket.nature_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "nature_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.nature_bucket]

  bucket = aws_s3_bucket.nature_bucket.id
  acl    = "private"
}


# Create S3 bucket for DataSummit
resource "aws_s3_bucket" "data_bucket" {
  bucket = "datasummit-bucket"
 }

resource "aws_s3_bucket_ownership_controls" "data_bucket" {
  bucket = aws_s3_bucket.data_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "data_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.data_bucket]

  bucket = aws_s3_bucket.data_bucket.id
  acl    = "private"
}

# Output created bucket names
output "created_buckets" {
  value = [
    aws_s3_bucket.adventure_bucket.bucket,
    aws_s3_bucket.nature_bucket.bucket,
    aws_s3_bucket.data_bucket.bucket
  ]
}
