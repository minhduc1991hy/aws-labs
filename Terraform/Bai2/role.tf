resource "aws_iam_role" "s3_rds_role" {
  name = "S3_RDS_Role"
  assume_role_policy = file("policy_ec2.json")
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AmazonRDSFullAccess"]
}

resource "aws_iam_instance_profile" "s3_rds_profile" {
  name = "S3_RDS_Profile"
  role = aws_iam_role.s3_rds_role.name
}