#!/bin/bash

echo "Clean klusterlet Operator"
oc -n open-cluster-management patch klusterlet klusterlet --type=merge -p '{"metadata": {"finalizers":null}}'
oc -n open-cluster-management delete klusterlet klusterlet
oc -n open-cluster-management delete deploy klusterlet klusterlet-registration-agent klusterlet-work-agent
sleep 5

echo "Clean the CRDs"
for i in $(oc get crds |grep -Ei 'open-cluster-management|observ' | awk '{print $1}') ; do oc patch crd $i --type=merge -p '{"metadata": {"finalizers":null}}'; done
oc get crds -o name |grep -Ei 'open-cluster-management|observ' | xargs oc delete
sleep 5

echo "Clean CRD HelmReleases"
oc delete crd helmreleases.apps.open-cluster-management.io
sleep 5

echo "Clean the clusterrolebindings for ACM"
oc get clusterrolebindings | grep open-cluster-management | awk '{print $1}' | xargs oc delete clusterrolebinding
oc get clusterrolebindings -o name |grep -Ei 'open-cluster-management|observ' | xargs oc delete
sleep 5

echo "Clean the clusterroles for ACM"
oc get clusterroles | grep open-cluster | awk '{print $1}' | xargs oc delete clusterroles
oc get clusterroles -o name |grep -Ei 'open-cluster-management|observ' | xargs oc delete
sleep 5

echo "Clean the other CRDs"
oc -n open-cluster-management patch crd/applicationmanagers.multicloud.ibm.com --type=merge -p '{"metadata": {"finalizers":null}}'
sleep 5

echo "Deleting the ns"
oc patch ns open-cluster-management-agent --type=merge -p '{"metadata": {"finalizers":null}}'
oc delete ns open-cluster-management-agent
sleep 5
