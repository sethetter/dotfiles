.PHONY: setup
setup:
	homebrew install ansible
	ansible-galaxy collection install community.general

.PHONY: apply
apply:
	ansible-playbook playbooks/main.yml -i hosts
