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

1. In values.yaml, set your clustername, appname, replicas, and image.
2. `./scripts/deploy.sh`


## Cleanup

To delete the EKS cluster:
`./eks_cleanup.sh <name of the cluster to delete>`