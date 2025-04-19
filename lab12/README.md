Automate key pair creation, security group setup, EC2 launch and termination using ansible



Running the Playbook
ansible-playbook playbooks/create_keypair.yml --ask-vault-pass
ansible-playbook playbooks/create_security_group.yml
ansible-playbook playbooks/launch_instance.yml
ansible-playbook playbooks/terminate_instance.yml





