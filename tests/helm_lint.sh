#!/bin/bash
helm lint ../.
if [ $? -eq 0 ]
then
  echo "Helm lint successful, $APP_NAME will be deployed."
else
  echo "Unit Test unsuccessful, check helm errors above." >&2
  exit 1
fi