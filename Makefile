export ANSIBLE_CONFIG=ansible.cfg

TARGET=$(shell hostname)

PLAY=ansible-playbook
ARGS=-i hosts.yaml --extra-vars "target=$(TARGET)" -D site.yaml

check:
	$(PLAY) -C $(ARGS)

check-verbose:
	$(PLAY) -C -vvvv $(ARGS)

run:
	$(PLAY) $(ARGS)
