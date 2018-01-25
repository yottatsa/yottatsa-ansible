.PHONY: pull all update

update: system security web mx

all: update

pull:
	git fetch
	git verify-commit origin/master
	git checkout master --force
	git merge

%: %.yml pull
	grep -q hosts: $<
	ansible-playbook -i lo $<

