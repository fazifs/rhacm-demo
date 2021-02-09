# Usage

1. First of all oc client installed and working

2. Log in to the Hub cluster from your terminal (oc login ....)

```
git clone https://github.com/avaleror/rhacm-demo.git
cd rhacm-demo
```

## For Git:

```
oc apply -k git/acm-resources/
```

## For Helm

```
oc apply -k helm/
```

## For Object Storage (Ongoing)

TBD

## Enjoy!

All the resources will be created on the Hub cluster, after that the etherpad app will be deployed to the clusters affected by the placement rule
