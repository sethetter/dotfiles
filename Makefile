.PHONY: default
default: setup brew ansible

.PHONY: setup
setup:
	brew install ansible

.PHONY: ansible
ansible:
	ansible-playbook playbooks/main.yml -i hosts

.PHONY: brew
brew:
	brew bundle --cleanup --zap
