NOMAD_VERSION = 0.8.7
CACHE_BUST = $(shell date -u +"%Y-%m-%dT00:00:00Z")

define build_image
  docker build . --pull \
    --tag bltavares/nomad:$(2) \
		--tag bltavares/nomad:$(NOMAD_VERSION)-$(2) \
		--build-arg NOMAD_VERSION=$(NOMAD_VERSION) \
		--build-arg BUILD_DATE=$(CACHE_BUST) \
		--build-arg BUILDER_ARCH=$(1) \
		--build-arg TARGET_ARCH=$(2)
endef

amd64:
	$(call build_image,amd64,amd64)

arm64:
	$(call build_image,arm64v8,arm64v8)

armel:
	$(call build_image,arm32v6,arm32v5)

armhf:
	$(call build_image,arm32v7,arm32v7)

publish:
	docker push bltavares/nomad:amd64
	docker push bltavares/nomad:arm32v5
	docker push bltavares/nomad:arm32v7
	docker push bltavares/nomad:arm64v8

	docker push bltavares/nomad:$(NOMAD_VERSION)-amd64
	docker push bltavares/nomad:$(NOMAD_VERSION)-arm32v5
	docker push bltavares/nomad:$(NOMAD_VERSION)-arm32v7
	docker push bltavares/nomad:$(NOMAD_VERSION)-arm64v8

manifest:
	docker manifest create --amend \
	  bltavares/nomad:$(NOMAD_VERSION) \
	  bltavares/nomad:$(NOMAD_VERSION)-amd64 \
	  bltavares/nomad:$(NOMAD_VERSION)-arm32v5 \
	  bltavares/nomad:$(NOMAD_VERSION)-arm32v7 \
	  bltavares/nomad:$(NOMAD_VERSION)-arm64v8

	docker manifest annotate bltavares/nomad:$(NOMAD_VERSION) \
	  bltavares/nomad:$(NOMAD_VERSION)-amd64 --os linux \
	  --arch amd64

	 docker manifest annotate bltavares/nomad:$(NOMAD_VERSION) \
	  bltavares/nomad:$(NOMAD_VERSION)-arm32v5 --os linux \
	  --arch arm --variant v5

	docker manifest annotate bltavares/nomad:$(NOMAD_VERSION) \
	  bltavares/nomad:$(NOMAD_VERSION)-arm32v7 --os linux \
	  --arch arm --variant v7

	docker manifest annotate bltavares/nomad:$(NOMAD_VERSION) \
	  bltavares/nomad:$(NOMAD_VERSION)-arm64v8 --os linux \
	  --arch arm64

	docker manifest push bltavares/nomad:$(NOMAD_VERSION)

	docker manifest create --amend \
	  bltavares/nomad:latest \
	  bltavares/nomad:amd64 \
	  bltavares/nomad:arm32v5 \
	  bltavares/nomad:arm32v7 \
	  bltavares/nomad:arm64v8

	docker manifest annotate bltavares/nomad:latest \
	  bltavares/nomad:amd64 --os linux \
	  --arch amd64

	 docker manifest annotate bltavares/nomad:latest \
	  bltavares/nomad:arm32v5 --os linux \
	  --arch arm --variant v5

	docker manifest annotate bltavares/nomad:latest \
	  bltavares/nomad:arm32v7 --os linux \
	  --arch arm --variant v7

	docker manifest annotate bltavares/nomad:latest \
	  bltavares/nomad:arm64v8 --os linux \
	  --arch arm64

	docker manifest push bltavares/nomad:latest

all: amd64 arm64 armel armhf

.PHONY: all arm64 armel armhf amd64 publish manifest
