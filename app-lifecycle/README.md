# HOW TO USE IT

First of all oc client installed and working

Log in to the Hub cluster from your terminal (oc login ....)

git clone https://github.com/avaleror/nvs-demo.git

cd nvs-demo

oc apply -k app-lifecycle/acm-resources/

All the resources will be created on the Hub cluster, after that the etherpad app will be deployed to the clusters affected by the placement rule 
