# API Nodejs with IaC Terraform

```

aws sts assume-role --role-arn <arn_role> --role-session-name <session_name>

cd infrastructure
cd keypair
ssh-keygen -t rsa -b 2048 -f "api_node_key"
cd ..
terraform init
terraform apply
```
