resource "kubernetes_manifest" "cluster" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" : "run.tanzu.vmware.com/v1alpha1",
    "kind" : "TanzuKubernetesCluster",
    "metadata" : {
      "name" : var.name,
      "namespace" : var.namespace
    },
    "spec" : {
      "distribution" : {
        "version" : var.k8sVersion
      },
      "topology" : {
        "controlPlane" : {
          "count" : var.controlPlaneVMCount,
          "class" : var.controlPlaneVMClass,
          "storageClass" : var.controlPlaneStorageClass
        },
        "workers" : {
          "count" : var.workerVMCount,
          "class" : var.workerVMClass,
          "storageClass" : var.workerStorageClass
        }
      },
      "settings" : {
        "network" : {
          "cni" : {
            "name" : var.cni
          },
          "services" : {
            "cidrBlocks" : jsonencode(var.servicesCIDR)
          },
          "pods" : {
            "cidrBlocks" : jsonencode(var.podsCIDR)
          }
        },
        "storage" : {
          "classes" : jsonencode(var.storageClasses),
          "defaultClass" : var.defaultStorageClass
        }
      }
    }
  }
}
