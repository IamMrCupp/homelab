# Homelab

Homelab Setup

The following technologies are in use:
- [Ansible](https://www.ansible.com/)
- [containerd](https://containerd.io/)
- [Kuberentes](https://kubernetes.io/)

Requirements:
- ansible community module installed via `ansible-galaxy`
  - `ansible-galaxy collection install community.general`
    

## Steps to configure the homelab
- Clone the git repo to local machine
- Modify hosts to make sure it matches layout
- Update raspberry pi nodes: `ansible-playbook update_nodes.yml`
- Configure raspberry pi nodes: `ansible-playbook raspberrypi.yml`
- Login to k8s MASTER node: `ssh USERNAME@HOSTNAME`
    - Pull Images: `sudo kubeadm config images pull`
    - Init k8s MASTER: `sudo kubeadm init --pod-network-cidr=10.244.0.0/16` 
    - Copy kubectl config to homedir
    ```
        mkdir -p $HOME/.kube
        sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
        sudo chown $(id -u):$(id -g) $HOME/.kube/config
    ```
    - Make note of `kubeadm join` command in output from `kubeadm init`
- Apply network overlay [(calico)](https://www.projectcalico.org/) `kubectl apply -f calico.yaml`
- Join worker nodes
    - SSH to k8s workers: `ssh USERNAME@HOSTNAME`
    - Join k8s cluster
    ```
        sudo kubeadm join 192.168.7.140:6443 --token TOKEN --discovery-token-ca-cert-hash HASHEDSHA256
    ```



### Directory Layout:
``` 
├── README.md                   <- this file
├── ansible                     <- ansible related stuff
│   ├── .gitignore              <- gitignore file
│   ├── ansible.cfg             <- ansible config
│   ├── group_vars              <- group variables live here   (DIRECTORY)
│   │   └── raspberrypi.yml     <- raspberry pi variables      
│   ├── host_vars               <- host variables live here    (DIRECTORY)
│   ├── hosts.yml               <- inventory file for ansible  
│   ├── logs                    <- ansible logs                (DIRECTORY)
│   │── homelab.yml             <- homelab playbook
│   │── raspberrypi.yml         <- raspberrypi playbook
│   └── roles                   <- roles for ansible live here
│       ├── cgroups
│       │   └── tasks
│       │       └── main.yml    <- cgroups modification playbook
│       ├── containerd
│       │   └── tasks
│       │       └── main.yml    <- containerd install playbook
│       ├── kubernetes
│       │   └── tasks
│       │       └── main.yml    <- kubernetes install playbook
│       └── sysmods
│           └── tasks
│               └── main.yml    <- system mods for kuberentes happen here
├── helm                        <- helm charts
└── kubernetes
    └── calico.yaml             <- Calico CNI config 
```






