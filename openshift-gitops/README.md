## Configuration of a central instance of OpenShift GitOps

1. Deploy the OpenShift GitOps operator on the managed Cluster
2. Create a clusterset, in this concrete example we have created a clusterset that groups all the AWS clusters
3. ```oc apply -f gitops-config.yaml``` 
4. This will create all the pieces needed to use a central Argo to deploy to all the clusters in the clusterset based on labels.

NOTES:
- Take into account that gitops-config.yaml needs to be modified to meet your requirements.
- If you use ArgoCD instead of OpenHift GitOps you need to adjust the namespace where all the parts will be deployed.
