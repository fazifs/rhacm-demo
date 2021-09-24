## This is not working good at the moment, not sure if will remain in the product. Anyways you can prepare an standard cluster deployment and cutomize the install-config.yaml to 1 master and zero workers, this will deploy a SNO using hive.

In order to be able to provision single node clusters using ACM it is needed to enable the feature gate in the hub cluster.
To do so you need to ```oc apply -f featuregate.yaml```
