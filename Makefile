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

DOCKER_USERNAME := niqdev
DOCKER_IMAGE_NAME := alpine-xfce-vnc
DOCKER_IMAGE := $(DOCKER_USERNAME)/$(DOCKER_IMAGE_NAME)

.PHONY: docker-build
docker-build: require-docker
	docker build -t $(DOCKER_IMAGE) .

.PHONY: docker-run
docker-run: require-docker
	docker run --rm --name $(DOCKER_IMAGE_NAME) -it -p 5900:5900 -p 6080:6080 $(DOCKER_IMAGE)

.PHONY: docker-clean
docker-clean: require-docker
	# remove container by name
	docker ps -a -q -f name=$(DOCKER_IMAGE_NAME) | xargs --no-run-if-empty docker rm -f
	# remove image by name
	docker images -q $(DOCKER_IMAGE) | xargs --no-run-if-empty docker rmi -f
	# delete dangling images <none>
	docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi -f
	# delete dangling volumes
	docker volume ls -q -f dangling=true | xargs --no-run-if-empty docker volume rm -f
