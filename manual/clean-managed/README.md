## ACM Managed Cleaner

This is a script for cleaning an ACM Managed cluster because it's not successfully detached, or the
cluster died without being detached at all.

This script tries to clean all the objects (CRDs, CRs, ClusterRoles/Bindings, Namespaces, etc) for
the open-cluster-management agents in the cluster.

Testing is in progress
