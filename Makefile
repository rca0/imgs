IMAGE_NAME = ruancasas/ubuntu
IMAGE_TAG = latest

PLATFORM ?= linux/amd64,linux/arm64 

.PHONY: build
build:
	docker buildx create --use
	docker buildx inspect --bootstrap
	docker buildx build --platform $(PLATFORM) -t $(IMAGE_NAME):$(IMAGE_TAG) .

.PHONY: push
push:
	docker buildx create --use
	docker buildx inspect --bootstrap
	docker buildx build --platform $(PLATFORM) -t $(IMAGE_NAME):$(IMAGE_TAG) --push .

.PHONY: all
all: build push
