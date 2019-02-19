Ansible Proxmox KVM Management
==============================

Ansible Role - Create and manage Proxmox KVM VMs

Requirements
------------

See *requirements.txt*.

Use this command to install all requirements:
`pip install -r requirements.txt`

Setup credentials in ENV with:
`source extras/proxmox-variables.sh`
The script will add automatically @pem to the username.

If you prefer, you can setup the credentials in a secure vault file, using these parameters:
    
    credentials:
      username: root@pem
      password: yourpassword


Role Variables
--------------

See defaults/globals.yml for the complete list of variables.
See also [proxmox_kvm](https://docs.ansible.com/ansible/latest/modules/proxmox_kvm_module.html) module page.

Usage
-----

Define a list of virtual machines in this format:

    vm_list:
       - name: vm1
         net: {"net0":"virtio=32:5F:B4:35:16:0F,bridge=vmbr0"}
         scsi: {"scsi0":"local-lvm:8,ssd=1"}
         cores: 1
         memory: 1024
         balloon: 512
         vga: vmware
       - name: vm2
         net: {"net0":"virtio=32:5F:B4:37:16:0F,bridge=vmbr1"}
         scsi: {"scsi0":"local-lvm:16,ssd=1"}
         cores: 4
         memory: 4096
         protection: yes
        
         

Execute playbook:
`ansible-playbook ansible-proxmox-kvm-mgmt.yml --tags "OPERATION"`

Tag **OPERATION**:
  * Create VMs
    * **present**
    * **create**
  * Start VMs
    * **started**
    * **start**
  * Delete VMs
    * **absent**
    * **delete**
  * Stop VMs
    * **stopped**
    * **stop**
  * Restart VMs
    * **restarted**
    * **restart**
  * List VMs
    * **current**
    * **list**
  * Update VMs
    * **update** 


Example Playbook
----------------

    - hosts: localhost  
      roles:
         - ansible-proxmox-kvm-mgmt
      vars:
        - global_api_host: NODE_IP or NODE_DNS_NAME
        - global_node: "NODENAME"

**And other variables from defaults/main/globals.yml**

License
-------

GNU GPLv3