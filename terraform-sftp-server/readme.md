# AWS SFTP Server Terraform Setup

This repository provides Terraform modules to set up an AWS SFTP server, including an S3 bucket, IAM roles and policies, the AWS Transfer Server, and Transfer users. This README aims to guide you through the setup process.

## Prerequisites

Before you begin, ensure you have the following:

1. [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
2. AWS credentials configured, either through environment variables or AWS CLI configuration.

## Modules

The setup is divided into separate modules, each responsible for a specific part of the infrastructure.

### 1. S3 Module

This module creates an S3 bucket to store the SFTP user's data.

- Location: `sftp_modules/s3`

### 2. IAM Module

This module creates the IAM roles and policies required for the SFTP server and users.

- Location: `sftp_modules/iam`

### 3. Transfer Server Module

This module sets up the AWS Transfer Server.

- Location: `sftp_modules/transfer_server`

### 4. Transfer User Module

This module creates Transfer users associated with the SFTP server.

- Location: `sftp_modules/transfer_user`

## Getting Started

1. Clone this repository to your local machine.
2. Navigate to the module you want to set up.

<pre>
```bash
    cd sftp_modules/MODULE_NAME
</pre>

1. Modify the variables.tf file in the module directory to customize the setup, if needed.

2. Run terraform init to initialize the module.

3. Run terraform apply to create the resources.

4. Review the changes, and if you're satisfied, type yes to confirm and apply the changes.

5. Once applied, Terraform will output relevant information. Make sure to note down these values for future reference.To destroy the resources, run terraform destroy.

Now that you've completed the setup, you can continue using your infrastructure as needed.

## Notes

- Make sure to customize variables as per your requirements and best practices.

- The tags attribute in each module is for resource categorization and organization. Modify them to your preferred tagging strategy.

## Conclusion

This setup uses Terraform to create an AWS SFTP server with separate modules for different resources. By following the steps above, you can efficiently set up an SFTP server while maintaining modularity and best practices.

For any issues or questions, feel free to open an issue in this repository.