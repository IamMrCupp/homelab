# Homelab

## Kubernetes Packages via HELM (v3)
The following packages are being used in the homelab k8s setup
- [NFS Subdirectory External Provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)
    + Setup kubernetes-sigs
    ```
    helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
    ```
    + Install NFS provisioner
    ```
    helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=192.168.7.74 \
    --set nfs.path=/volume3/docker
    ```
- [HAProxy k8s Ingress](https://github.com/haproxytech/kubernetes-ingress)
    + Create namespace for k8s
    ```
    kubectl create namespace kubernetes-ingress
    ```
    + Configure repo and update helm package info
    ```
    helm repo add haproxytech https://haproxytech.github.io/helm-charts
    helm repo update
    ```
   + Install HA-Proxy k8s Ingress 
       * generate yamls for inspection
        ```
        helm install kubernetes-ingress haproxytech/kubernetes-ingress \
        --debug \
        --dry-run
        ```
       * Proper installation 
        ```
        helm install kubernetes-ingress haproxytech/kubernetes-ingress 
        ```
- [Certificate Manager](https://cert-manager.io/)
    + Configure Namespace
    + Install helm repo and update helm
    + Install certificate-manager via helm

