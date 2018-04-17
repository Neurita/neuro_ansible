install:
	pipenv install --skip-lock

cleanall: clean-ansible clean-env

clean: clean-ansible

clean-ansible:
	rm -fr playbook.retry
	rm -fr .ansible_cache/

clean-env:
	pipenv --rm
	rm Pipfile.lock
