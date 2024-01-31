IMAGE_NAME = ruancasas/ubuntu
IMAGE_TAG = latest

.PHONY: build
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

.PHONY: push
push:
	docker push $(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: all
all: build push
