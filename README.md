## AWS GLUE SAGEMAKER NOTEBOOK , A terraform example script

# terraform-aws-lakeformation_glue_sagemaker_notebook
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

This terraform module creates a sagemaker notebook and it's associated Glue Dev Endpoint to access a table shared via lakeformation service.

## Is this module versioned?
Yes. The module adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html), by tagging commits on the `master` branch.

## Pre-commit scripts
`pre-commit` config in the repo does the below things to maintain consistent coding guidelines and fix security issues.
- [terraform_fmt](https://github.com/antonbabenko/pre-commit-terraform/blob/master/terraform_fmt.sh): Rewrites all terraform configuration files to a canonical format.
- [terraform_tflint](https://github.com/terraform-linters/tflint): Validates all Terraform configuration files with TFLint. 
- [terraform_tfsec](https://github.com/liamg/tfsec): TFSec static analysis of terraform templates to spot potential security issues.
- [check-merge-conflict](https://github.com/pre-commit/pre-commit-hooks#check-merge-conflict): Check for files that contain merge conflict strings.

Autoupdate pre-commit packages to their latest versions.
```bash
pre-commit autoupdate
```

To temporarily disable these checks, use `git commit -m "commit_message" --no-verify` or `SKIP=terraform_fmt git commit -m "commit_message"`.

## To get started
- Run the dev dependencies using the below.
```bash
brew bundle
pre-commit install
```
- If you don't have terraform installed already, do the below. Also, remember to set this version under `required_version` in `versions.tf`.
```bash
# Install the latest terraform version
tfenv install
# Use the version in the current workspace
tfenv use <x.y.z>
```

### 1. Create an IAM Role with below trust policy and AWS managed policies using the AWS Management Console
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lakeformation.amazonaws.com",
          "glue.amazonaws.com",
          "sagemaker.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}

#### a. AWSGlueServiceNotebookRole 
#### b. AWSGlueServiceRole
#### c. AWSGlueConsoleSageMakerNotebookFullAccess 
#### d. AWSGlueConsoleFullAccess 
#### e. LakeFormationDataAccess  
#### f. AWSGlueSchemaRegistryFullAccess  

### 2

#### a. Terraform init
#### a. Terraform plan
#### a. Terraform apply

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

