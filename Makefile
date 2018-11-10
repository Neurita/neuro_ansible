image-name = "neurita/neuro_docker"
version = 0.1
# version-string := $(shell grep '__version__ = '  $(project-name)/version.py)
# version := $(subst __version__ = ,,$(version-string))

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
