# Import Policies into ACM

## TODO Finish this readme

- Log in the Hub cluster
- un `kubectl apply -k .` from within this directory in your terminal.

In 2.4+ the Policies need to have a [Subscription Administrator](https://github.com/open-cluster-management/policy-collection#subscription-administrator)

For example in acm-lab-deploy + rhpds:

```
oc get clusterrolebinding open-cluster-management:subscription-admin -o yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  creationTimestamp: "2021-12-01T15:47:27Z"
  name: open-cluster-management:subscription-admin
  resourceVersion: "1087128"
  uid: 970ce3ee-d0c1-46c3-9289-709cbb74d966
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: open-cluster-management:subscription-admin
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: ocp-admin
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: opentlc-mgr
```
