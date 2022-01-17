.PHONY: apply
apply:
	ansible-playbook playbooks/main.yml -i hosts

.PHONY: brew
brew:
	arch -arm64 brew bundle --cleanup --zap
