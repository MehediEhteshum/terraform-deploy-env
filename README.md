<h1>Terraform: Multi-Cloud Environment Deployment</h1>

<h2>Introduction</h2>

This project demonstrates how we can deploy development / staging / production environment to different clouds (Azure / AWS / GCP) using a single Terraform project base utilizing basic to advance terraform features.<br>
The project shows the practical demonstration of environment deployment to Azure. Similarly, it will work with other cloud providers.<br><br>

![Deployed env](https://github.com/MehediEhteshum/terraform-deploy-env/blob/main/azure-env/screenshots/6%20after%20terraform%20apply.png)

This covers -

- the standard file structure used in a Terraform project
- important Terraform commands
- using differnt providers
- managing different environments' resources using modules
- managing common variables and outputs for the modules
- usage of datasources
- deploying VM with custom data using bash script to different clouds
- using windows or linux script to add host to SSH config file

<h2>How to guide</h2>

- To deploy the resources in Azure, login to Azure account first using `az login` command.<br><br>
![azure login](https://github.com/MehediEhteshum/terraform-deploy-env/blob/main/azure-env/screenshots/1%20az%20login.png)
- As you added required providers and modules, run `terraform init` command to initialize the local backend as well as the modules.<br><br>
![Initializing](https://github.com/MehediEhteshum/terraform-deploy-env/blob/main/azure-env/screenshots/2%20terraform%20init.png)
- To validate the terraform project for correctness before deploying, run `terraform plan`, and enter required variables' values. Note that, we need to input cloud provider name, type of the deployment environment and local OS. With these variables and the power of terraform module, we can deploy the same environment to differnt clouds, and we can also decide what environment to deploy (i.e. dev / prod), and run local OS specific script during the deployment. If it passes, it will show what are the changes going to be implemented (add / change / destroy).<br><br>
![Plan](https://github.com/MehediEhteshum/terraform-deploy-env/blob/main/azure-env/screenshots/3%20terraform%20plan.png)
![Plan passed](https://github.com/MehediEhteshum/terraform-deploy-env/blob/main/azure-env/screenshots/5%20terraform%20plan.png)
- Once the plan passes, run `terraform apply` command to deploy or make the changes. This will also capture the latest state of the cloud environment in the `terraform.tfstate` file. For future 'terraform apply' operations, it will store the past state as a backup in the `terraform.tfstate.backup` file. If the operation succeeds, it will deploy the resources or make required changes to the cloud environment. In case of Azure, we will see a similar successful deployment shown in the picture in the 'Introduction' section.
