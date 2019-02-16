export ANSIBLE_CONFIG=ansible.cfg

TARGET=$(shell hostname)

PLAY=ansible-playbook
ARGS=-i hosts --extra-vars "target=$(TARGET)" -D site.yaml

check:
	sudo $(PLAY) -C $(ARGS)

check-verbose:
	sudo $(PLAY) -C -vvvv $(ARGS)

run:
	sudo $(PLAY) $(ARGS)
