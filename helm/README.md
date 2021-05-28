# Homelab

## Kubernetes Packages via HELM (v3)
The following packages are being used in the homelab k8s setup

- [NFS Subdirectory External Provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)
    - Setup kubernetes-sigs
```
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
```
    - Install NFS provisioner
```
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
--set nfs.server=192.168.7.74 \
--set nfs.path=/volume3/docker
```

- [Certificate Manager](https://cert-manager.io/)
    - Configure Namespace
```
kubectl create namespace cert-manager
```
    - Install helm repo and update helm
```
helm repo add jetstack https://charts.jetstack.io
helm repo update
```
    - Install certificate-manager via helm
```
helm install \
cert-manager jetstack/cert-manager \
--namespace cert-manager \
--create-namespace \
--version v1.3.1 \
--set installCRDs=true
```

- [nginx kubernetes-ingress]()
    - Install helm repo and update cache
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```
    - Install 
```
helm install \
kubernetes-ingress-nginx ingress-nginx/ingress-nginx \
--namespace kubernetes-ingress-nginx
--create-namespace
```
    + Post Install (linkerd injection)
```
kubectl get deploy --namespace kubernetes-ingress-nginx -o yaml | linkerd inject - | kubectl apply -f -
```

- [HAPROXY kubernetes-ingress]()
    + Create Namespace
    + Install helm repo and update cache
```
helm repo add haproxytech https://haproxytech.github.io/helm-charts
helm repo update
```
    + Install 
```
helm install \
kubernetes-ingress-haproxy haproxytech/kubernetes-ingress \
--namespace kubernetes-ingress-haproxy  \
--create-namespace \
--set defaultBackend.image.repository=gcr.io/google_containers/defaultbackend-arm
```
    + Post Install (linkerd injection)
```
kubectl get deploy --namespace kubernetes-ingress-haproxy -o yaml | linkerd inject - | kubectl apply -f -
```
    