username = "demo"
namespace = "demo2"

k8s-clusters = {
    dev-cluster = {
        k8sVersion            = "v1.20"
        controlPlane = {
            count             = 1
            vmClass           = "best-effort-xsmall"
            storageClass      = "kubernetes"
        }
        workerNodes = {
            count             = 1
            vmClass           = "best-effort-xsmall"
            storageClass      = "kubernetes"
        }
        settings = {
            network = {
                cni           = "antrea"
                servicesCIDR  = ["10.96.2.0/24"]
                podsCIDR      = ["10.244.16.0/21"]
            }
            storage = {
                classes       = ["kubernetes"]
                defaultClass  = "kubernetes"
            }
        }
    }
    
}

