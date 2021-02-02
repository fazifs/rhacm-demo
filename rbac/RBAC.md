# Cluster Lifecycle RBAC
Create 4 users in the Hub cluster:
- cluster-admin
- admin
- editor
- viewer

The cluster-admin user is going to be a cluster admin, the admin user only will only manage the aws-managed1 cluster, editor will have edit permissions and the editor user will have just read permissions.

# Create a cluster admin role

Assign clusterrole to user cluster-admin
oc adm policy add-cluster-role-to-user open-cluster-management:cluster-manager-admin cluster-admin

# Administer a managed cluster named aws-managed1:

oc adm policy add-cluster-role-to-user open-cluster-management:admin:aws-managed1 admin
oc adm policy add-role-to-user open-cluster-management:admin:aws-managed1 admin

# Assig roles to editor and viewer users

oc adm policy add-cluster-role-to-user edit editor
oc adm policy add-cluster-role-to-user view viewer

