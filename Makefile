IMAGE_NAME=srzzumix/docker-luau

help: ## Display this help screen
	@grep -E '^[a-zA-Z][a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/^GNUmakefile://' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## build docker image
	docker build -t ${IMAGE_NAME} .

run: ## run bash in docker
	docker run -it --rm --entrypoint bash ${IMAGE_NAME}

rmi:
	docker image rm ${IMAGE_NAME}
