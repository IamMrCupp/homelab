# Homelab

Homelab Setup

The following technologies are in use:
- [Ansible](https://www.ansible.com/)
- [containerd](https://containerd.io/)
- [Kuberentes](https://kubernetes.io/)
    
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
│       ├── microk8s
│       │   └── tasks
│       │       └── main.yml    <- microk8s playbook (not in use)
│       └── sysmods
│           └── tasks
│               └── main.yml    <- system mods for kuberentes happen here
├── helm                        <- helm charts
└── kubernetes                  <- kuberentes YAMLs
```






