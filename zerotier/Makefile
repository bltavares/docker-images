ZEROTIER_VERSION = 1.6.6
CACHE_BUST = $(shell date -u +"%Y-%m-%dT00:00:00Z")

define build_image
  docker build . --pull \
    --tag bltavares/zerotier:$(1) \
		--tag bltavares/zerotier:$(ZEROTIER_VERSION)-$(1) \
		--build-arg ZEROTIER_VERSION=$(ZEROTIER_VERSION) \
		--build-arg BUILD_DATE=$(CACHE_BUST) \
		--build-arg BUILDER_ARCH=$(1) \
		--build-arg TARGET_ARCH=$(1)
endef

amd64:
	$(call build_image,amd64)

x86:
	$(call build_image,i386)

arm64:
	$(call build_image,arm64v8)

armhf:
	$(call build_image,arm32v7)

armel:
	$(call build_image,arm32v5)

ppc64le:
	$(call build_image,ppc64le)

publish:
	docker push bltavares/zerotier:amd64
	docker push bltavares/zerotier:i386
	docker push bltavares/zerotier:arm32v5
	docker push bltavares/zerotier:arm32v7
	docker push bltavares/zerotier:arm64v8
	docker push bltavares/zerotier:ppc64le

	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-amd64
	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-i386
	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-arm32v5
	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-arm32v7
	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-arm64v8
	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-ppc64le

manifest:
	docker manifest create \
	  bltavares/zerotier:$(ZEROTIER_VERSION) \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-amd64 \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-i386 \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-arm32v5 \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-arm32v7 \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-arm64v8 \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-ppc64le

	docker manifest annotate bltavares/zerotier:$(ZEROTIER_VERSION) \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-amd64 --os linux \
	  --arch amd64

	docker manifest annotate bltavares/zerotier:$(ZEROTIER_VERSION) \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-i386 --os linux \
	  --arch 386

	 docker manifest annotate bltavares/zerotier:$(ZEROTIER_VERSION) \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-arm32v5 --os linux \
	  --arch arm --variant v5

	docker manifest annotate bltavares/zerotier:$(ZEROTIER_VERSION) \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-arm32v7 --os linux \
	  --arch arm --variant v7

	docker manifest annotate bltavares/zerotier:$(ZEROTIER_VERSION) \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-arm64v8 --os linux \
	  --arch arm64

	docker manifest annotate bltavares/zerotier:$(ZEROTIER_VERSION) \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-ppc64le --os linux \
	  --arch ppc64le

	docker manifest push --purge bltavares/zerotier:$(ZEROTIER_VERSION)

	docker manifest create \
	  bltavares/zerotier:latest \
	  bltavares/zerotier:amd64 \
	  bltavares/zerotier:i386 \
	  bltavares/zerotier:arm32v5 \
	  bltavares/zerotier:arm32v7 \
	  bltavares/zerotier:arm64v8 \
	  bltavares/zerotier:ppc64le

	docker manifest annotate bltavares/zerotier:latest \
	  bltavares/zerotier:amd64 --os linux \
	  --arch amd64

	docker manifest annotate bltavares/zerotier:latest \
	  bltavares/zerotier:i386 --os linux \
	  --arch 386

	 docker manifest annotate bltavares/zerotier:latest \
	  bltavares/zerotier:arm32v5 --os linux \
	  --arch arm --variant v5

	docker manifest annotate bltavares/zerotier:latest \
	  bltavares/zerotier:arm32v7 --os linux \
	  --arch arm --variant v7

	docker manifest annotate bltavares/zerotier:latest \
	  bltavares/zerotier:arm64v8 --os linux \
	  --arch arm64

	docker manifest annotate bltavares/zerotier:latest \
	  bltavares/zerotier:ppc64le --os linux \
	  --arch ppc64le

	docker manifest push --purge bltavares/zerotier:latest

all: amd64 x86 arm64 armel armhf ppc64le

.PHONY: all arm64 armel armhf amd64 x86 ppc64le publish manifest
