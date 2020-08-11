#!/bin/bash
helm lint ../.
if [ $? -eq 0 ]
then
  echo "Unit Test successful, $CLUSTER_NAME is up and you can now issue kubectl commands to it"
else
  echo "Unit Test unsuccessful, check CloudFormation in the AWS console to troubleshoot failure" >&2
  exit 1
fi