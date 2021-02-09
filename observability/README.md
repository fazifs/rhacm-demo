## Observability

The observability feature is not enabled by default in RHACM. We need to follow some simple steps in order to enable it.
You can find this process in the official documentation in here: https://access.redhat.com/documentation/en-us/red_hat_advanced_cluster_management_for_kubernetes/2.1/html-single/observing_environments

The process in simple and you can find it explained here.

[1. Create a namespace called open-cluster-management-observability in the Hub cluster]
```
oc create namespace open-cluster-management-observability
```

[2. Create a bucket in aws/gcp/azure/ceph]
We will use this bucket to store data from the managed clusters that Thanos will consume and present to a Graphana dashboard

```
aws s3api create-bucket --bucket obs-thanos --region eu-north-1 --create-bucket-configuration LocationConstraint=eu-north-1
```

[3. Create a secret to access this bucket]

```
oc apply -f thanos-storage.yaml
```

[4. Create a pull secret in the open-cluster-management-observability namespace] 
If the pull secret is not present we will have problems.

```
oc create secret generic multiclusterhub-operator-pull-secret --from-file=.dockercfg=<path/to/.dockercfg> --type=kubernetes.io/dockercfg
```

[5. Now is time to create the MultiClusterObservability custom resource (mco CR).]
When created this mco object the operator will trigger the installation of all the components

```
oc apply -f observability.yaml
```

#### Results

Two namespaces in the hub cluster
- open-cluster-management-observability
- open-cluster-management-addon-observability

We will get pods running in bot namespaces like in this examples:

```
$ oc get po -n open-cluster-management-observability
NAME                                                              READY   STATUS    RESTARTS   AGE
alertmanager-0                                                    2/2     Running   0          94m
alertmanager-1                                                    2/2     Running   0          94m
alertmanager-2                                                    2/2     Running   0          93m
grafana-585644c774-pjr58                                          1/1     Running   0          94m
grafana-585644c774-rml6s                                          1/1     Running   0          94m
observability-observatorium-observatorium-api-654499cb4b-hfzzh    1/1     Running   0          94m
observability-observatorium-observatorium-api-654499cb4b-sr72k    1/1     Running   0          94m
observability-observatorium-thanos-compact-0                      1/1     Running   0          94m
observability-observatorium-thanos-compact-1                      1/1     Running   0          93m
observability-observatorium-thanos-compact-2                      1/1     Running   0          93m
observability-observatorium-thanos-query-6dcdfc5777-c52fg         1/1     Running   0          94m
observability-observatorium-thanos-query-6dcdfc5777-rbgmc         1/1     Running   0          94m
observability-observatorium-thanos-query-frontend-54876f552snf7   1/1     Running   0          94m
observability-observatorium-thanos-query-frontend-54876f55qg2j6   1/1     Running   0          94m
observability-observatorium-thanos-receive-controller-8587sgt8w   1/1     Running   0          94m
observability-observatorium-thanos-receive-default-0              1/1     Running   0          94m
observability-observatorium-thanos-receive-default-1              1/1     Running   0          93m
observability-observatorium-thanos-receive-default-2              1/1     Running   0          93m
observability-observatorium-thanos-rule-0                         1/1     Running   0          94m
observability-observatorium-thanos-rule-1                         1/1     Running   0          93m
observability-observatorium-thanos-rule-2                         1/1     Running   0          93m
observability-observatorium-thanos-store-memcached-0              2/2     Running   0          94m
observability-observatorium-thanos-store-memcached-1              2/2     Running   0          93m
observability-observatorium-thanos-store-memcached-2              2/2     Running   0          93m
observability-observatorium-thanos-store-shard-0-0                1/1     Running   0          94m
observability-observatorium-thanos-store-shard-1-0                1/1     Running   0          94m
observability-observatorium-thanos-store-shard-2-0                1/1     Running   0          94m
observatorium-operator-6cfc5df55f-2hgrd                           1/1     Running   0          94m
rbac-query-proxy-6477c5ccf7-bnd2h                                 1/1     Running   0          94m
rbac-query-proxy-6477c5ccf7-r2mw6                                 1/1     Running   0          94m
```

```
$ oc get po -n open-cluster-management-addon-observability
NAME                                               READY   STATUS    RESTARTS   AGE
endpoint-observability-operator-85b89dc599-nb68m   2/2     Running   0          94m
metrics-collector-deployment-6449bf8469-7r885      1/1     Running   0          94m
```

**Now you can go to the main Dashboard and you'll find a Graphana link where to consult metrics from the managed clusters.**

