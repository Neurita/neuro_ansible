# neuro_deploy

This Ansible project is to develop and deploy the Neuroimaging tools for Neuro-Pypes.

## Installation

You need a Python environment and install the dependencies:

```
pip install -r requirements.txt
```

## Running

To configure and deploy in a remote machine, do:

```
./playbook.yml -l prodremote --extra-vars="ansible_host=<remote_ipaddress> ansible_ssh_user=<remote_user>"
```


## Testing

This project includes a Vagrantfile.
With `vagrant` you can launch a
Debian VM and provision it with this project.

For that, do:

```
vagrant up
```
