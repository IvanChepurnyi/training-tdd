TDD Training Environment
============================================

System Requirements
-------------------

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](http://vagrantup.com)

Installation
------------

Initialize the host by the following command

```bash
bash setup-host.sh
```


After the following steps, you will receive a fully ready environment with phpunit, magento and EcomDev_PHPUnit extension installed.

Troubleshooting
---------------

In case if you receive a Guru Mediation, then adjust settings for VM in Vagrant file, by turning off some of the virtualization features:
- ``--cpus`` - amount of cpus to be used for guest machine
- ``--pae``  - flag for using of PAE/NX motherboard feature
- ``--hwvirtex`` - flag for using of VT-x/AMD-V hardware virtualization
- ``--memory`` - amount of RAM consumed by guest machine

