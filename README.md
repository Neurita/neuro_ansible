# neuro_deploy

This Ansible project is to develop and deploy the Neuroimaging tools for Neuro-Pypes.


## Installation

You need a Python environment and install the dependencies:

```bash
pipenv install
```


## Running

To configure and deploy in a remote machine, do:

```bash
./playbook.yml -l neuro --extra-vars="ansible_host=<ip_address> ansible_user=<user_name> n_cpus=4" -K
```


## Testing

This project includes a Vagrantfile.
With `vagrant` you can launch a
Debian VM and provision it with this project.

For that, do:

```bash
vagrant up
```
