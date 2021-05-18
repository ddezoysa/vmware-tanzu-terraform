variable "name" {
  description = "Cluster Name"
}

variable "namespace" {
  description = "Cluster Namespace"
}

variable "k8sVersion" {
  description = "Kubernetes Version"
}

# Control Plane Configuration

variable "controlPlaneVMCount" {
  type        = number
  description = "Control Plane VM Count"
  default     = 1
}

variable "controlPlaneVMClass" {
  description = "Control Plane VM Class"
  default     = "best-effort-xsmall"
}

variable "controlPlaneStorageClass" {
  description = "Control Plane Storage Class"
  default     = "kubernetes"
}

# Worker Node Configuration

variable "workerVMCount" {
  type        = number
  description = "Worker VM Count"
  default     = 1
}

variable "workerVMClass" {
  description = "Worker VM Class"
  default     = "best-effort-xsmall"
}

variable "workerStorageClass" {
  description = "Worker Storage Class"
  default     = "kubernetes"
}

# Settings

variable "cni" {
  description = "CNI: antrea, calico"
  default     = "antrea"
}

variable "servicesCIDR" {
  description = "Services CIDR Blockes"
  type        = list(string)
  default     = ["198.51.100.0/12"]
}

variable "podsCIDR" {
  description = "Pods CIDR Blockes"
  type        = list(string)
  default     = ["192.0.2.0/16"]
}

variable "storageClasses" {
  description = "Storage Classes"
  type        = list(string)
  default     = ["kubernetes"]
}

variable "defaultStorageClass" {
  description = "Default Storage Class"
}
