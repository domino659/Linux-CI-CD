# Linux-Test

### Required:
- Terraform
- Ansible



#### Command
ansible-playbook 00_setup_local.yml -e "ansible_become_password=4141"
ansible-playbook -i inv/udd/hosts 01_setup_remote.yml
ansible-playbook -i inv/udd/hosts 02_web_server.yml