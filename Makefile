.PHONY: setup
setup:
	# TODO: install homebrew first
	homebrew install ansible
	ansible-galaxy collection install community.general

.PHONY: apply
apply:
	ansible-playbook playbooks/main.yml -i hosts

.PHONY: brew
brew:
	brew bundle --cleanup --zap
