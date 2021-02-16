# Import Policies into ACM in the GitOps way

From this repo you  can create a policies repo, in the acm-resources folder you'll find different folders with configurations for policies. When you use this you'll create a subscriptions repo inside RHACM. If you want to change something in a policy like the labels, the enforcement, etc. you need to send a PR to the repo defined in the channel in order to do so.

### How to use this repo
Inside the acm-resources folder, you'll find a folder named Common-Resources and inside of it you can find the channel and the namespace+secret creation for all policies. These objects have to be present, execute the next command:

```
oc apply -k acm-resources/Common-Resources/
    or
kubectl apply -k acm-resources/Common-Resources/ 
```
Now you have the namespace acm-policies, the secret to access the git repo and the channel created but the subscriptions are missing. 
The policies have been splitted in different subscriptions, one for configuration management policies, another one for access control policies, another one for policies that are being tested at the moment and a global policy that places all the policies under one single subscription.
For instance if you want to use just the configuration management policies after creating the common resources you need to create the proper subscription like this:

```
oc apply -f acm-resources/Subscriptions/CM-policies.yaml
   or
kubectl apply -f acm-resources/Subscriptions/CM-policies.yaml
```
Once you've created all the necessary resources you'll find all the policies in the repo in the governance area inside RHACM.
