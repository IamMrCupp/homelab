# Homelab

This repo contains the various things that make up the homelab setup


### Directory Layout:
``` bash
├── README.md                   <-- this file
├── ansible                     <-- ansible related stuff
│   ├── .gitignore              <-- gitignore file
│   ├── ansible.cfg             <-- ansible config
│   ├── group_vars              <-- group variables live here (directory)
│   │   └── raspberrypi.yml     <-- raspberry pi variables
│   ├── host_vars               <-- host variables live here (directory)
│   ├── hosts.yml               <-- inventory file for ansible 
│   ├── logs                    <-- ansible logs (directory)
│   ├── playbooks               <-- ansible playbooks live here (directory) 
│   │   ├── homelab.yml         <-- homelab playbook
│   │   └── raspberrypi.yml     <-- raspberrypi playbook
│   └── roles                   <-- roles for ansible live here
│       ├── cgroups
│       │   └── tasks
│       │       └── main.yml    <-- cgroups modification playbook
│       ├── microk8s
│       │   └── tasks
│       │       └── main.yml    <-- microk8s playbook (not in use)
│       └── sshkeys
│           └── tasks
│               └── main.yml    <-- sshkey setup
├── helm                        <-- helm charts
└── kubernetes                  <-- kuberentes charts
```






