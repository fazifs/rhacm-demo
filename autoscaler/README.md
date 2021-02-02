## Autoscaler

### Generate Custom MachineAutoscalers

* Fetch the machineset in your cluster:

```
export MACHINESETS=$(oc get machineset -n openshift-machine-api -o json | jq '.items[]|.metadata.name' -r )
```

* Construct the machineautoscaler based in a template and customize them with the specific machineset

```
for ms in $MACHINESETS; do export MACHINESET=$ms; envsubst < machineautoscaler.yml > machineautoscaler-$ms.yml; done
```

* Check the machineautoscaler generated

```
ls | grep machineautoscaler-cluster
```

### Apply the ClusterAutoscaler & MachineAutoscaler

* Apply the clusterautoscaler

```
oc apply -f clusterautoscaler.yml
```

* Apply the machineautoscalers (each for each AZ or only one)

```
for i in $(ls | grep machineautoscaler-cluster); do oc apply -f $i ; done
```

* Check that the machineautoscaler are applied properly

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






