# AWS IaC simple demo APP

## Requirements
In order to run this simple example you need to setup HashiCorp terraform cloud. 
Create workspace, provide AWS credentials and generate API token. Follow below tutorial:

https://learn.hashicorp.com/tutorials/terraform/github-actions#set-up-terraform-cloud

Next save token in Github secrets as `TF_API_TOKEN`:

https://learn.hashicorp.com/tutorials/terraform/github-actions#set-up-terraform-cloud

Fork this repo and modify `main.tf` file providing your `organization` and `workspace` names.

```
terraform {
  backend "remote" {
    organization = "<your organization name>"
    workspaces {
      name = "<your workspace name>"
    }
  }
  required_version = ">= 0.14.7"
}
```

Default region is`eu-west-1 (Ireland)`. If you want to choose another one please edit `variables.tf` file.

## Run 
Once you've pushed a commit to repo an automatic workflow `Apply changes` will be triggered. 
It will apply terraform code to your AWS account. 

After workflow is finished go to workflow `Outputs` section. You will see API adress of deployed web service.

(Alternatively you can check API adress on your Terraform Cloud in `Outputs` section)
![image](https://user-images.githubusercontent.com/26739110/127641214-805f047a-ee95-457f-bad2-a0bbb943cde8.png)

## Test
In order to test web service use REST API query tool e.g. curl or Postman.

Example:
```
curl --header "Content-Type: application/json" --data '{"username":"xyz","password":"xyz"}' ${API_URL}/api
```

Response:
```
Welcome to our demo API, here are the details of your request:
 **Headers**
{"Accept": "*/*", "Content-Type": "application/x-www-form-urlencoded", "Host": "jvgra4cp1k.execute-api.eu-west-1.amazonaws.com", "User-Agent": "curl/7.55.1"}  **Method**
POST
 **Body**
"'{username:xyz,password:xyz}'"
```

*Most of tools add some default headers to the REST requests - don't be suprised if there some extra headers in the response 

## Clean stack
In order to clean stack go to Actions tab and select `Clean the stack` workflow. Next click `Run workflow` - it will trigger terraform destroy command. 

(Alternatively you can go to Terraform Cloud select *Settings>Destruction and Deletion* and select `Queue destroy plan`)
