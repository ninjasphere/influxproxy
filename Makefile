SHA1 := $(shell git rev-parse --short HEAD | tr -d "\n")
IMAGE=ninjasphere/influxproxy

image:
	docker build -t "$(IMAGE)" .
	@echo $(IMAGE)

push:
	docker push $(IMAGE)

push-tag: image tag
	docker push $(IMAGE):$(SHA1)
	@echo pushed $(IMAGE):$(SHA1)

tag: image
	docker tag -f $(IMAGE) $(IMAGE):$(SHA1)

