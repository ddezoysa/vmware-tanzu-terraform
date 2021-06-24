TF_ACTION=$1
ENVIRONMENT=$2
PARAMS=$3

export VAR_FILE="../workspaces/${ENVIRONMENT}/terraform.tfvars"
export KUBECTL_VSPHERE_USERNAME=$(cat $VAR_FILE | grep username | cut -d \" -f2)
export KUBECTL_VSPHERE_PASSWORD=1234Qwer$
export SUPERVISOR_API=10.0.10.30
export KUBECONFIG=kubeconfig/kubeconfig.yaml

cat <<EOT > backend.tf
terraform {
  backend "local" {
    path = "../workspaces/${ENVIRONMENT}/terraform.tfstate"
  }
}
EOT

if [ "$TF_ACTION" = 'init' ]; then
  terraform ${TF_ACTION} ${PARAMS}
elif [ "$TF_ACTION" = 'connect' ]; then
  export NAMESPACE=$(cat $VAR_FILE | grep namespace | cut -d \" -f2)
  kubectl vsphere login --server=${SUPERVISOR_API} --vsphere-username=${KUBECTL_VSPHERE_USERNAME}@vsphere.local --tanzu-kubernetes-cluster-namespace=${NAMESPACE} --tanzu-kubernetes-cluster-name=${PARAMS} --insecure-skip-tls-verify
  kubectl config use-context ${PARAMS}
else
  kubectl vsphere login --server=${SUPERVISOR_API} --vsphere-username=${KUBECTL_VSPHERE_USERNAME}@vsphere.local --insecure-skip-tls-verify
  kubectl config use-context ${SUPERVISOR_API}
  terraform ${TF_ACTION} -var-file=${VAR_FILE} ${PARAMS}
fi;