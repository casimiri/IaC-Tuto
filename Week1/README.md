## Install terraform 1.15.9 
https://github.com/casimiri/iac/blob/main/install.md


## Create the VPC in AWS, eu region
### Write the tf code

### Login to HCP
Create an access token in AWS
`export TF_TOKEN_app_terraform_io=$token`

# Terraform plan

Create Environment variables for the HCP workspace

`AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY`

run 
`
terraform init
terraform plan
terraform apply` 

## NEXT
- create subnets in the VPC