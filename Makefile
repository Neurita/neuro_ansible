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

docker-image:
	pipenv run packer build packer/neuro_docker-export.json

docker-run:
	pipenv run packer build packer/neuro_docker-run.json
