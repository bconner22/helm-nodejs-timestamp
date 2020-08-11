# Helm deploy of your application

## What does this do?  

1. Deploys your app into EKS
2. Creates a load balancer and gives access to your app through a public facing AWS URL

## Prerequisites(TODO Tighten up the IAM so admin isn't required)

Either:

An Amazon Linux Cloud9 instance with an admin IAM role named 'eksadmin' attached

OR

A Linux(RedHat/yum based) machine with an admin IAM named 'eksadmin' attached TODO case for multiple Linuxes


## How to use this repo

### Initial install(no helm charts are deployed yet):

CURRENTLY BROKEN/NEEDS WORK
1. Modify the example nodejs/charts/nodejs334, populating nodejs/charts/nodejs334/values.yaml with your cluster name, image, and what you'd like to name your app
2. `./scripts/deploy.sh <app_name>`
3. `helm install nodejs1 ./nodejs` # Will install everything in ./nodejs
4. # Does not yet work - Modify the example ingress/charts/ingress1, populating ingress/charts/ingress1/values.yaml with your app1name, app2name, etc.
5. # Does not yet work -`helm install ingress ./ingress}` 
## Cleanup

To delete the EKS cluster:
`./eks_cleanup.sh <name of the cluster to delete>`