.PHONY: pull all update

update: system security web mx

all: update

pull:
	git fetch
	git verify-commit master
	git checkout master --force

%: %.yml pull
	grep -q hosts: $<
	ansible-playbook -i lo $<

