# Homelab

**Homelab Setup**

The following technologies are used in the homelab:
- [Raspberry Pi4](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/)
- [PicoCluster](https://www.picocluster.com/)
- [Synology NAS](https://www.synology.com/en-us)
- [Cisco](https://www.cisco.com/)
- [Eero](https://eero.com/)
- [Ubuntu 20.04LTS](https://ubuntu.com/)
- [Ansible](https://www.ansible.com/)
- [containerd](https://containerd.io/)
- [Kuberentes](https://kubernetes.io/)
- [Calico](https://www.projectcalico.org/)
- [Kubernetes NFS provider](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)
- [Linkerd](https://linkerd.io/)
- [Nginx](https://www.nginx.com/)
- [HAProxy](https://www.haproxy.com/)

Requirements:
- ansible community module installed via `ansible-galaxy`
  - `ansible-galaxy collection install community.general`
    

## Steps to configure the homelab
- Clone the git repo to local machine
- Modify hosts to make sure it matches layout
- Update raspberry pi nodes: 
    ```
    ansible-playbook update_nodes.yml
    ```
- Configure raspberry pi nodes: 
    ```
    ansible-playbook raspberrypi.yml
    ```
- Login to k8s MASTER node:
    - Pull Images: 
        ```
        sudo kubeadm config images pull
        ```
    - Init k8s MASTER: 
        ```
        sudo kubeadm init --pod-network-cidr=10.244.0.0/16
        ```
    - Copy kubectl config to homedir
        ```
        mkdir -p $HOME/.kube
        sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
        sudo chown $(id -u):$(id -g) $HOME/.kube/config
        ```
    - Make note of `kubeadm join` command in output from `kubeadm init`
- Apply network overlay (from control-plane or remote kubectl)
    ```
    kubectl apply -f calico.yaml
    ```
- Join worker nodes
    - SSH to k8s worker node(s)
    - Join k8s cluster
        ```
        sudo kubeadm join 192.168.7.140:6443 --token TOKEN --discovery-token-ca-cert-hash HASHEDSHA256
        ```
- **PROFIT**

Now that we have a "functional" cluster we can add some more nice-to-have things.
- Install modules into the k8s cluster to make things more functional
    + Setup NFS Provisioner
    + Setup Linkerd
    + Setup MetalLB
    + Setup nginx-ingress
    + Setup haproxy-ingress
    + Setup cert-manager


### Directory Layout:
``` 
├── README.md
├── ansible
│   ├── ansible.cfg
│   ├── group_vars
│   │   └── raspberrypi.yml
│   ├── homelab.yml
│   ├── host_vars
│   ├── hosts.yml
│   ├── logs
│   ├── raspberrypi.yml
│   ├── roles
│   │   ├── calicoctl
│   │   │   ├── files
│   │   │   └── tasks
│   │   │       └── main.yml
│   │   ├── cgroups
│   │   │   └── tasks
│   │   │       └── main.yml
│   │   ├── containerd
│   │   │   └── tasks
│   │   │       └── main.yml
│   │   ├── kubernetes
│   │   │   └── tasks
│   │   │       └── main.yml
│   │   └── sysmods
│   │       ├── files
│   │       │   ├── 99-kubernetes-cri.conf
│   │       │   └── containerd.conf
│   │       └── tasks
│   │           └── main.yml
│   └── update_nodes.yml
└── kubernetes
    ├── README.md
    ├── calico
    │   └── calico.yml
    ├── linkerd
    │   └── linkerd-jaeger.yml
    ├── metallb
    │   └── config.yml
    └── tmp
        ├── test-claim.yaml
        ├── test-pod.yaml
        └── test-resources.yml
```






