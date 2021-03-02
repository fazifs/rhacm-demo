## ACM Managed Cleaner

This is a script for cleaning an ACM Managed cluster because it's not successfully detached, or the
cluster died without being detached at all.

This script tries to clean all the objects (CRDs, CRs, ClusterRoles/Bindings, Namespaces, etc) for
the open-cluster-management agents in the cluster.

Testing is in progress

### Usage

```
curl https://raw.githubusercontent.com/ocp-tigers/rhacm-demo/develop/manual/clean-managed/clean-managed.sh?token=ABKJKOK32YITRLNMQVBZ2MTAHY7LK | bash
```
