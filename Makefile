.DEFAULT_GOAL := docker-run

require-%:
	@ if [ "$(shell command -v ${*} 2> /dev/null)" = "" ]; then \
		echo "[$*] not found"; \
		exit 1; \
	fi

check-param-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Missing parameter: [$*]"; \
		exit 1; \
	fi

##############################

DOCKER_USERNAME := edgelevel
DOCKER_IMAGE_NAME := alpine-xfce-vnc
DOCKER_IMAGE := $(DOCKER_USERNAME)/$(DOCKER_IMAGE_NAME)
GIT_TAG_LATEST := $(shell git describe --abbrev=0 --tags | sed 's/v//g')

.PHONY: docker-build
docker-build: require-docker
	docker build -t $(DOCKER_IMAGE):base base/
	docker build -t $(DOCKER_IMAGE):web web/

.PHONY: docker-run
docker-run: require-docker check-param-tag docker-build
	docker run --rm --name $(DOCKER_IMAGE_NAME) --hostname alpine -p 5900:5900 -p 6080:6080 --security-opt seccomp=unconfined $(DOCKER_IMAGE):${tag}

.PHONY: docker-clean
docker-clean: require-docker
	# remove container by name
	docker ps -a -q -f name=$(DOCKER_IMAGE_NAME) | xargs --no-run-if-empty docker rm -f
	# delete dangling images <none>
	docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi -f
	# remove image by name
	docker images -q $(DOCKER_IMAGE) | xargs --no-run-if-empty docker rmi -f
	# delete dangling volumes
	docker volume ls -q -f dangling=true | xargs --no-run-if-empty docker volume rm -f

.PHONY: docker-login
docker-login: check-param-docker-password
	echo ${docker-password} | docker login -u $(DOCKER_USERNAME) --password-stdin

.PHONY: docker-push
docker-push: docker-build docker-login
	docker tag $(DOCKER_IMAGE):base $(DOCKER_IMAGE):latest
	docker tag $(DOCKER_IMAGE):base $(DOCKER_IMAGE):$(GIT_TAG_LATEST)
	docker tag $(DOCKER_IMAGE):base $(DOCKER_IMAGE):base-$(GIT_TAG_LATEST)
	docker tag $(DOCKER_IMAGE):web $(DOCKER_IMAGE):web-$(GIT_TAG_LATEST)
	docker image push --all-tags $(DOCKER_IMAGE)
