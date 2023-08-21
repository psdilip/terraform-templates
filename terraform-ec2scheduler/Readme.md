# Automated EC2 Instance Scheduling with Terraform

This project demonstrates how to automate the scheduling of EC2 instances using Terraform. It utilizes AWS Lambda, IAM roles, and EC2 instances to start and stop instances based on a specified schedule.

## Table of Contents

- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Deploying Resources](#deploying-resources)
- [Cleanup](#cleanup)

## Project Structure

The project is organized into different directories, each responsible for a specific part of the infrastructure setup:

- `lambda`: Contains the AWS Lambda function code and configuration.
- `iam`: Defines the IAM role and policies required for the Lambda function.
- `ec2`: Sets up an EC2 instance with specified tags for automation.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- An AWS account with appropriate permissions to create Lambda functions, IAM roles, and EC2 instances.
- Terraform installed on your local machine. You can download it from the [Terraform website](https://www.terraform.io/downloads.html).

## Getting Started

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/your-username/terraform-ec2-scheduler.git

2. Change into the project directory

    ```sh
    cd terraform-ec2-scheduler

## Configuration

1. Navigate to the main.tf file in the root directory and update the following placeholders:
- your_region: Replace with your desired AWS region.
- ami-12345678: Replace with the appropriate AMI ID for your EC2 instance.
2. If needed, you can further customize the tag values for the Lambda function, IAM resources, and EC2 instance by modifying the respective sections in main.tf.


## Deploying Resources

1. Initialize Terraform in the root directory

    ```sh
    terraform init

2. Preview Plan Changes

    ```sh
    terraform plan

3. Apply the changes to create the resources

    ```sh
    terraform apply

## Cleanup

To clean up the resources created by this project:

1. Navigate to the project directory in your terminal.

2. Run the following command to destroy the resources:

    ```sh
    terraform destroy
