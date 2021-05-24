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
- Install 


### Directory Layout:
``` 
├── README.md                   <- this file
├── ansible                     
│   ├── .gitignore              <- gitignore file
│   ├── ansible.cfg             <- ansible config
│   ├── group_vars              
│   │   └── raspberrypi.yml     <- raspberry pi variables      
│   ├── host_vars               
│   ├── hosts.yml               <- inventory file for ansible  
│   ├── logs                    
│   │── homelab.yml             <- homelab playbook
│   │── raspberrypi.yml         <- raspberrypi playbook
│   └── roles                   <- roles for ansible live here
│   │   ├── calicoctl
│   │   │   ├── files
│   │   │   └── tasks
│   │   │       └── main.yml    <- calicoctl install playbook
│   |   ├── cgroups
│   |   │   └── tasks
│   |   │       └── main.yml    <- cgroups modification playbook
│   |   ├── containerd
│   |   │   └── tasks
│   |   │       └── main.yml    <- containerd install playbook
│   |   ├── kubernetes
│   |   │   └── tasks
│   |   │       └── main.yml    <- kubernetes install playbook
│   |   └── sysmods
│   |       └── tasks
│   |           └── main.yml    <- system mods for kuberentes happen here
│   └── update_nodes.yml        <- update nodes playbook
├── helm                        
│   └── README.md               <- info on helm charts installed
└── kubernetes                  
    ├── README.md               <- info on what k8s related yamls installed/do
    ├── calico.yaml             <- Calico CNI config for k8s
    └── linkerd-jaeger.yml      <- custom jaeger 
```






