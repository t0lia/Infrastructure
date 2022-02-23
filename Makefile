OS=linux
ARCH=amd64

export ANSIBLE_VAULT_PASSWORD_FILE=${HOME}/.ansible/infrastructure

setup-static-site: initial nginx docker

initial:
	ansible-playbook --extra-vars "ansible_user=root" playbook/initial/main.yml

nginx:
	ansible-playbook playbook/nginx/main.yml

docker:
	ansible-playbook playbook/docker/main.yml

ping:
	ansible -m ping all

free:
	ansible all -a "free -h "

encrypt:
	ansible-vault encrypt inventory/group_vars/all/vault.yml

decrypt:
	ansible-vault decrypt inventory/group_vars/all/vault.yml

view:
	ansible-vault view inventory/group_vars/all/vault.yml
