# Homelab

## Kubernetes Packages via HELM (v3)
The following packages are being used in the homelab k8s setup
- [NFS Subdirectory External Provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)
    - Setup kubernetes-sigs repo
    ```
    helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
    ```
    - Install provisioner 
    ```
    helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=192.168.7.74 \
    --set nfs.path=/volume3/docker
    ```
- Linkerd
    - Setup linkerd repo
        - Stable
        ```
        helm repo add linkerd https://helm.linkerd.io/stable
        ```
        - Edge
        ```
        helm repo add linkerd-edge https://helm.linkerd.io/edge
        ```
    - Install linkerd 
        - Stable
        ```
        helm install linkerd2 \
            --set-file identityTrustAnchorsPEM=ca.crt \
            --set-file identity.issuer.tls.crtPEM=issuer.crt \
            --set-file identity.issuer.tls.keyPEM=issuer.key \
            --set identity.issuer.crtExpiry=$(date -v+8760H +"%Y-%m-%dT%H:%M:%SZ") \
            linkerd/linkerd2
        ```
        - Edge
        ```helm install linkerd2 \
             --set-file identityTrustAnchorsPEM=ca.crt \
            --set-file identity.issuer.tls.crtPEM=issuer.crt \
            --set-file identity.issuer.tls.keyPEM=issuer.key \
            --set identity.issuer.crtExpiry=$(date -v+8760H +"%Y-%m-%dT%H:%M:%SZ") \
            linkerd-edge/linkerd2
        ```

