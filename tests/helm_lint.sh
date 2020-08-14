#!/bin/bash
# TODO Figure out why this doesn't work - it returns:
# [INFO] Chart.yaml: icon is recommended
# [ERROR] templates/ingress/ingress.yaml: the kind "extensions/v1beta1 Ingress" is deprecated in favor of "networking.k8s.io/v1beta1 Ingress"
# Error: 1 chart(s) linted, 1 chart(s) failed
#
# Changing the ingress api to networking.k8s.io/v1beta1 will make the lint pass, but helm will fail.  Helm bug?



# helm lint .
# if [ $? -eq 0 ]
# then
#   echo "Helm lint successful, $APP_NAME will be deployed."
# else
#   echo "Unit Test unsuccessful, check helm errors above." >&2
#   exit 1
# fi