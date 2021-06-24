provider "kubernetes-alpha" {
  config_path = "./kubeconfig/kubeconfig.yaml" // path to kubeconfig
  insecure    = true
}

module "tanzu-kubernetes-cluster" {
  for_each                 = var.k8s-clusters
  source                   = "../modules/tanzu-kubernetes-cluster"
  name                     = each.key
  namespace                = var.namespace
  k8sVersion               = each.value.k8sVersion
  controlPlaneVMCount      = each.value.controlPlane.count
  controlPlaneVMClass      = each.value.controlPlane.vmClass
  controlPlaneStorageClass = each.value.controlPlane.storageClass
  workerVMCount            = each.value.workerNodes.count
  workerVMClass            = each.value.workerNodes.vmClass
  workerStorageClass       = each.value.workerNodes.storageClass
  cni                      = each.value.settings.network.cni
  servicesCIDR             = each.value.settings.network.servicesCIDR
  podsCIDR                 = each.value.settings.network.podsCIDR
  storageClasses           = each.value.settings.storage.classes
  defaultStorageClass      = each.value.settings.storage.defaultClass
}
