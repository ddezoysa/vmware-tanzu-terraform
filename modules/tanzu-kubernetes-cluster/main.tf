

resource "kubernetes_manifest" "cluster" {
  provider = kubernetes-alpha

  manifest = yamldecode(templatefile("${path.module}/template.yaml", {
    NAME = var.name
    NAMESPACE = var.namespace
    K8S_VERSION = var.k8sVersion

    CP_COUNT = var.controlPlaneVMCount
    CP_VM_CLASS = var.controlPlaneVMClass
    CP_STORAGE_CLASS = var.controlPlaneStorageClass

    W_COUNT = var.workerVMCount
    W_VM_CLASS = var.workerVMClass
    W_STORAGE_CLASS = var.workerStorageClass

    CNI = var.cni
    SERVICE_CIDR = jsonencode(var.servicesCIDR)
    POD_CIDR = jsonencode(var.podsCIDR)
    STORAGE_CLASSES = jsonencode(var.storageClasses)
    DEFAULT_STORAGE_CLASS = var.defaultStorageClass
  }))
}
