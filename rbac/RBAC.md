# RBAC in RHACM

## Users
These user will have different roles with different purposes

Users: 
- acm-admin
- admin
- cluster-user
- editor
- viewer
* * *

## Assign diferent roles to different users

### ACM-ADMIN

We will assign the acm admin role **"open-cluster-management:cluster-manager-admin"** to this user


$ oc adm policy add-cluster-role-to-user open-cluster-management:cluster-manager-admin acm-admin

### ADMIN

Assign the cluster role admin to the user

$ oc adm policy add-cluster-role-to-user admin admin

### CLUSTER-USER

The cluster-user is able to manage one cluster and deploy apps an policies on it. To do so we will assign two cluster roles to the user but the user also needs permissions in the specific cluster namespace.

The cluster-role **open-cluster-management:managedcluster:aws-managed1** allows a user to interact with this concrete cluster but not with others.

The cluster-role **open-cluster-management:subscription-admin** allows a user to be able to create and deploy objects in the namespaces managed by ACM without this permision the user would be able just to create and deploy in the namespace where the user has permissions.

$ oc adm policy add-cluster-role-to-user **open-cluster-management:managedcluster:aws-managed1** cluster-user

$ oc adm policy add-cluster-role-to-user **open-cluster-management:subscription-admin** cluster-user

$ oc adm policy add-role-to-user admin cluster-user -n aws-managed1

### EDITOR

This user is able to modify and interact with some resopurces but not able to deploy apps or create clusters.

$ oc adm policy add-cluster-role-to-user edit editor

### VIEWER

This user will be able just to see the diferent resources in ACM but not interact

$ oc adm policy add-cluster-role-to-user view viewer
