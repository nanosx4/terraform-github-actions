# AWS IaC simple demo APP

## Requirements
In order to run this simple example you need to setup HashiCorp terraform cloud. 
Create workspace, provide AWS credentials and generate API token. Follow below tutorial:

https://learn.hashicorp.com/tutorials/terraform/github-actions#set-up-terraform-cloud

Next save token in Github secrets as `TF_API_TOKEN`:

https://learn.hashicorp.com/tutorials/terraform/github-actions#set-up-a-github-repository

Fork this repo and modify `main.tf` file providing your `organization` and `workspace` names.

```
terraform {
  backend "remote" {
    organization = "<your organization name>"
    workspaces {
      name = "<your workspace name>"
    }
  }
  required_version = ">= 1.0.0"
}
```

Default region is`eu-west-1 (Ireland)`. If you want to choose another one please edit `variables.tf` file.

## Run 
Once you've pushed a commit to repo `Apply changes` workflow will be triggered automatically. 
It will apply terraform code to your AWS account. 

After workflow is finished go to Actions>Last workflow run `Outputs` section. You will see API address of deployed web service.

![image](https://user-images.githubusercontent.com/26739110/127641214-805f047a-ee95-457f-bad2-a0bbb943cde8.png)
(Alternatively you can check API adress on your Terraform Cloud in `Outputs` section)

## Test
In order to test web service use REST API request tool e.g. curl or Postman.

Example:
```
curl --header "Content-Type: application/json" --data '{"username":"xyz","password":"xyz"}' ${API_URL}/api
```

Response:
```
Welcome to our demo API, here are the details of your request:

==Headers==
Accept: */*
Content-Type: application/json
Host: z60do1e422.execute-api.eu-west-1.amazonaws.com
User-Agent: curl/7.55.1

==Method==
POST

==Body==
"'{username:xyz,password:xyz}'"
```

*some additional default headers (specific to the tool you use when testing) may appear.

## Clean stack
In order to clean stack go to Actions tab and select `Clean the stack` workflow. Next click `Run workflow` - it will trigger terraform destroy command. 

(Alternatively you can go to Terraform Cloud select *Settings>Destruction and Deletion* and select `Queue destroy plan`)
