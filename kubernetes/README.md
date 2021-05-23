# homelab

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
        linkerd viz install | kubectl apply -f -
    ```
    - Install jaeger collector and UI
        - **NOTE**: The basic install command should have worked, but does not install multiarch enabled containers.
        ```
            linkerd jaeger install | kubectl apply -f -
        ```
        - Use a modified YAML to pull in some ARM containers so we can use this on the RasPi4 cluster
        ```
            kubectl apply -f kubernetes/linkerd-jaeger.yml
        ```
    - OPTIONAL: Install mesh on k8s control-plane nodes
    ```
        kubectl get deploy -o yaml -n kube-system | linkerd inject - | kubectl apply -f -
    ```

