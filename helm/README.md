# Homelab

## Kubernetes Packages via HELM (v3)
The following packages are being used in the homelab k8s setup
- [NFS Subdirectory External Provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)
    - Setup helm repo
    ```
    helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
    ```
    - Install provisioner 
    ```
    helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=192.168.7.74 \
    --set nfs.path=/volume3/docker
    ```

