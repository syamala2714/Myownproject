module "example_instance" {
  source = "./modules/ec2" # Relative path to your module directory

  instance_name = "ExampleInstance"
  ami_id = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  # Other instance-specific configurations
}

module "create_s3_bucket" {
    source = "../module/s3"

    s3_bucket_name = "ExampleS3"
}

output "example_instance_id" {
  value = module.ec2-instance.instance_id
}

