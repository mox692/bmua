CWD := $(shell pwd)
APP_NAME := bmua-app
IMAGE_NAME := bmua-image

build:
	docker build . -t $(IMAGE_NAME):latest
run:
	docker run --privileged --name $(APP_NAME) -v $(CWD)/src:/root/bmua -it $(IMAGE_NAME) bash 
down:
	docker stop $(APP_NAME) && docker rm -f $(APP_NAME)