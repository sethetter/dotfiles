.PHONY: apply
apply:
	ansible-playbook playbooks/main.yml -i hosts

.PHONY: brew
brew:
	brew bundle --cleanup --zap
