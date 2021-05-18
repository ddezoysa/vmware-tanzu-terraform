TF_ACTION=$1
ENVIRONMENT=$2
PARAMS=$3

export VAR_FILE="../workspaces/${ENVIRONMENT}/terraform.tfvars"

cat <<EOT > backend.tf
terraform {
  backend "local" {
    path = "../workspaces/${ENVIRONMENT}/terraform.tfstate"
  }
}
EOT

terraform ${TF_ACTION} -var-file=${VAR_FILE} ${PARAMS}