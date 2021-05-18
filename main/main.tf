provider "kubernetes-alpha" {
  config_path = "~/.kube/config" // path to kubeconfig
}

module "tanzu-kubernetes-cluster" {
  source                   = "../modules/tanzu-kubernetes-cluster"
  name                     = var.name
  namespace                = var.namespace
  k8sVersion               = var.k8sVersion
  controlPlaneVMCount      = var.controlPlaneVMCount
  controlPlaneVMClass      = var.controlPlaneVMClass
  controlPlaneStorageClass = var.controlPlaneStorageClass
  workerVMCount            = var.workerVMCount
  workerVMClass            = var.workerVMClass
  workerStorageClass       = var.workerStorageClass
  cni                      = var.cni
  servicesCIDR             = var.servicesCIDR
  podsCIDR                 = var.podsCIDR
  storageClasses           = var.storageClasses
  defaultStorageClass      = var.defaultStorageClass
}
