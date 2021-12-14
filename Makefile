.PHONY: apply
apply:
	ansible-playbook playbooks/main.yml -i hosts

homebrew:
	brew bundle --cleanup --zap