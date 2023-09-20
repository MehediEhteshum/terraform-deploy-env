<h1>Terraform: Multi-Cloud Environment Deployment</h1>

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
