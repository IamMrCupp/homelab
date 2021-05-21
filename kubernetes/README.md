# Homelab

## Kubernetes Packages via kubectl 
The following packages are being used in the homelab k8s setup
- [Linkerd](https://linkerd.io/)
    - Install linkerd cli
    ```
        brew install linkerd
    ```
    - Check k8s install 
    ```
        linkerd check --pre
    ```
    - Install linkerd in k8s cluster
    ```
        linkerd install | kubectl apply -f -
    ```
    - Run linkerd post install checks
    ```
        linkerd check
    ```
    - Install on-cluster metrics stack
    ```
        linkerd viz install | kubectl apply -f
    ```
    - Install jaeger collector and UI
    ```
        linkerd jaeger install | kubectl apply -f
    ```

