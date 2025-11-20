# **Terraform Lab: Variable Files and Precedence**

This repository demonstrates how Terraform determines the final value of a variable when it is defined in multiple locations.
Using an AWS EC2 provisioning example, this project shows how Terraform resolves conflicts between CLI flags, tfvars files, environment variables, and default variable definitions.

The screenshots in the `img/` folder document the output of each scenario.

---

## **Overview**

Terraform allows variables to be supplied from several sources. When the same variable is defined more than once, Terraform applies a fixed precedence order to select which value is used.

This lab recreates each precedence level using different `.tfvars` files, environment variables, and CLI overrides to show how the EC2 instance configuration changes depending on the source of the variable.

---

## **Variable Precedence Order (Highest to Lowest)**

Terraform processes variable values in the following order:

1. CLI arguments (`-var` and `-var-file`)
2. Files matching `*.auto.tfvars` and `*.auto.tfvars.json`
3. `terraform.tfvars.json`
4. `terraform.tfvars`
5. Environment variables (`TF_VAR_<name>`)
6. Default values in `variable` blocks

This order is based on the official Terraform documentation.

---

## **Repository Structure**

```
├── main.tf
├── ec2.tf
├── variables.tf
├── variable.tfvars
├── variable.auto.tfvars
├── img/
│   ├── -var_cli_server.png
│   ├── -var_cli_apply.png
│   ├── variable_auto_tfvars_server.png
│   ├── variable_auto_tfvars_apply.png
│   ├── variable_tf_server.png
│   ├── variable_tf_apply.png
│   ├── variable_tfvars_server.png
│   └── variable_tfvars_apply.png
└── README.md
```

Each screenshot in the `img/` directory corresponds to a different variable source being used by Terraform.

---

## **How to Reproduce This Lab**

### 1. Initialize Terraform

```sh
terraform init
```

### 2. Apply using default values

```sh
terraform apply --auto-approve
```

### 3. Apply using a `.tfvars` file

```sh
terraform apply -var-file="variable.tfvars" --auto-approve
```

### 4. Apply using a CLI override (highest precedence)

```sh
terraform apply -var="instance_type=t3.large" --auto-approve
```

### 5. Apply using an environment variable

```sh
export TF_VAR_instance_type=t3.micro
terraform apply --auto-approve
```

Compare the resulting AWS EC2 instance configurations with the screenshots stored in the `img/` folder.

---

## **Screenshot Reference**

The following categories of runs are documented:

* CLI overrides
* Explicit `.tfvars` file
* Automatic `*.auto.tfvars` loading
* Default values from `variables.tf`

All screenshots are located in the `img/` directory.

---

## **Security Notice**

Do not store sensitive information (e.g., AWS access keys) in variable files or Terraform configuration. Use environment variables, encrypted storage, or a secrets manager.

---


