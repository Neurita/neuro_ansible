image-name = "neurita/neuro_docker"
version = 0.1


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
	docker run -it --name neuro $(image-name):$(version) /bin/bash

tag:
	@echo "Create git tag v$(version), if not present"
	git rev-parse --verify v$(version) || (git tag v$(version) && git push --tags)

minor:
	pipenv run bumpversion minor

major:
	pipenv run bumpversion major
