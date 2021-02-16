## Autoscaler

* Fetch the first machineset in your cluster:

```
MACHINESET=$(oc get machineset -n openshift-machine-api -o json | jq .'items[0]|.metadata.name' -r)
```

* Adjust Machineset (lines 50 and 58) in the policy-autoscaler yaml

```
sed -i 's/changeme/$MACHINESET/g' policy-autoscaler.yml
```

* Apply the clusterautoscaler policy

```
oc apply -f policy-autoscaler.yml
```

* Check that the machineautoscaler and the clusterautoscaler are applied properly

```
oc get machineautoscaler -n openshift-machine-api
```

### Stress out the Openshift Cluster

```
oc adm new-project autoscale-example && oc project autoscale-example
```

```
oc create -n autoscale-example -f job-work-queue.yml
```

```
oc get pod -n autoscale-example
```

```
oc get machines -n openshift-machine-api
oc get machines -n openshift-machine-api
NAME                                         PHASE         TYPE          REGION      ZONE AGE
cluster-3707-cpl8m-master-0                  Running       m5a.xlarge    eu-west-1   eu-west-1a  87m
cluster-3707-cpl8m-master-1                  Running       m5a.xlarge    eu-west-1   eu-west-1b  87m
cluster-3707-cpl8m-master-2                  Running       m5a.xlarge    eu-west-1   eu-west-1c  87m
cluster-3707-cpl8m-worker-eu-west-1a-frt8c   Running       m5a.2xlarge   eu-west-1   eu-west-1a  78m
cluster-3707-cpl8m-worker-eu-west-1a-hh6p8   Provisioned   m5a.2xlarge   eu-west-1   eu-west-1a  70s
cluster-3707-cpl8m-worker-eu-west-1b-nklf5   Running       m5a.2xlarge   eu-west-1   eu-west-1b  78m
```

```
watch -n10 'oc get machines -n openshift-machine-api'
```
