.PHONY: apply
apply:
	ansible-playbook playbooks/main.yml -i hosts