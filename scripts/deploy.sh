#!/bin/bash
export CLUSTER_NAME=$(grep 'clustername:' values.yaml | tail -n1 | awk '{ print $2}')
export APP_NAME=$(grep 'appname:' values.yaml | tail -n1 | awk '{ print $2}')
# This will create an IAM policy to allow the ingress to create an ALB
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/iam-policy.json
aws iam create-policy \
    --policy-name ALBIngressControllerIAMPolicy \
    --policy-document file://iam-policy.json

eksctl utils associate-iam-oidc-provider --region=${AWS_REGION} --cluster=${CLUSTER_NAME} --approve
# Create a Kubernetes service account named alb-ingress-controller in the kube-system namespace, a cluster role, and a cluster role binding for the ALB Ingress Controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/rbac-role.yaml

# Create an IAM role for the ALB Ingress Controller and attach the role to the service account created in the previous step.
eksctl create iamserviceaccount \
    --region ${AWS_REGION} \
    --name alb-ingress-controller \
    --namespace kube-system \
    --cluster ${CLUSTER_NAME} \
    --attach-policy-arn arn:aws:iam::${ACCOUNT_ID}:policy/ALBIngressControllerIAMPolicy \
    --override-existing-serviceaccounts \
    --approve

helm repo update
# /tests/helm_lint.sh
# if [ $? -eq 0 ]
# then
#   echo "Lint Test successful, deploying release ${APP_NAME}"
# else
#   echo "Lint Test unsuccessful, helm errors above." >&2
#   exit 1
# fi

helm install ${APP_NAME} . --values values.yaml