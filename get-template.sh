#!/bin/bash
#Exit on non-zero status, even in pipelines. 
set -eo pipefail
#Exit on unbound variable
set -u
mkdir temp
cd temp
git init
git remote add origin -f https://github.com/pulumi/examples/
git config core.sparseCheckout true
TEMPLATE=azure-go-aks
echo $TEMPLATE >> .git/info/sparse-checkout
git pull origin master
cd ..
rm -rf temp/$TEMPLATE/.git
#rm -rf temp/$TEMPLATE/README.md
mv temp/$TEMPLATE/* .
rm -rf temp
