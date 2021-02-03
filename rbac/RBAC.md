# Cluster Lifecycle RBAC
Create 4 users in the Hub cluster:
- cluster-admin
- admin
- editor
- viewer

The cluster-admin user is going to be a cluster admin, the admin user only will only manage the aws-managed1 cluster, editor will have edit permissions and the editor user will have just read permissions.

# Assign the cluster admin role

Assign clusterrole to user cluster-admin
oc adm policy add-cluster-role-to-user open-cluster-management:cluster-manager-admin cluster-admin

# Administer a managed cluster named aws-managed1:

oc adm policy add-cluster-role-to-user open-cluster-management:managedcluster:aws-managed1 <user>
oc adm policy add-role-to-user admin <user> -n <cluster-name>

Example:
oc adm policy add-cluster-role-to-user open-cluster-management:managedcluster:aws-managed1 admin
oc adm policy add-role-to-user admin admin -n aws-managed1

# Assig roles to editor and viewer users

oc adm policy add-cluster-role-to-user edit editor
oc adm policy add-cluster-role-to-user view viewer

