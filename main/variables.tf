variable "namespace" {
  description = "Kubernetes Cluster Namespace"
}

variable "username" {
  description = "vSphere Username"
}

variable "k8s-clusters" {
  type = map(object({
    k8sVersion = string
    controlPlane = object({
      count        = number
      vmClass      = string
      storageClass = string
    })
    workerNodes = object({
      count        = number
      vmClass      = string
      storageClass = string
    })
    settings = object({
      network = object({
        cni          = string
        servicesCIDR = list(string)
        podsCIDR     = list(string)
      })
      storage = object({
        classes      = list(string)
        defaultClass = string
      })
    })
  }))
}
