# terraform-aws-eks

Terraform code to create a Kubernetes cluster in AWS with EKS.

## Overview

This project provides Terraform modules to create and manage an Amazon EKS (Elastic Kubernetes Service) cluster. It uses EKS Auto Mode to simplify managing the cluster.

## Features

- Create and manage EKS clusters with Terraform.
- Support for both managed and self-managed node groups.
- Integration with AWS services such as IAM, VPC, and CloudWatch.

## Usage

To provision a new cluster, execute the following commands:

```bash
terraform init
terraform apply
```

Once the cluster is provisioned, you can interact with it using `kubectl`. For example, to deploy a sample application:

```bash
aws eks update-kubeconfig --name <cluster_name>
kubectl apply -f deployment.yaml
```

## Requirements

- Terraform >= 1.3.2
- AWS Provider >= 5.81

## Documentation

For detailed documentation on configuring and utilizing the modules, refer to the following resources:

- [AWS EKS Documentation](https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html)
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)

## Contact

For any questions or issues, please open an issue on the GitHub repository.
