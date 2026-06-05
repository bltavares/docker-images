ZEROTIER_VERSION = 1.16.2
ifeq ($(OS), Windows_NT)
	CACHE_BUST = $(shell pwsh -c get-date -uformat +"%%Y-%%m-%%dT00:00:00Z")
else
	CACHE_BUST = $(shell date -u +"%Y-%m-%dT00:00:00Z")
endif

define build_image
  docker build . --pull \
		--provenance true \
    --tag bltavares/zerotier:$(1) \
		--tag bltavares/zerotier:$(ZEROTIER_VERSION)-$(1) \
		--build-arg ZEROTIER_VERSION=$(ZEROTIER_VERSION) \
		--build-arg BUILD_DATE=$(CACHE_BUST) \
		--build-arg BUILDER_ARCH=$(1) \
		--build-arg TARGET_ARCH=$(1) \
		--platform linux/$(if $(2),$(2),$(1))

endef

amd64:
	$(call build_image,amd64)

x86:
	$(call build_image,i386)

arm64:
	$(call build_image,arm64v8,arm64/v8)

armhf:
	$(call build_image,arm32v7,arm/v7)

ppc64le:
	$(call build_image,ppc64le)

publish:
	docker push bltavares/zerotier:amd64
	docker push bltavares/zerotier:i386
	docker push bltavares/zerotier:arm32v7
	docker push bltavares/zerotier:arm64v8
	docker push bltavares/zerotier:ppc64le

	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-amd64
	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-i386
	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-arm32v7
	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-arm64v8
	docker push bltavares/zerotier:$(ZEROTIER_VERSION)-ppc64le

manifest:
	docker buildx imagetools create \
	  --tag bltavares/zerotier:$(ZEROTIER_VERSION) \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-amd64 \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-i386 \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-arm32v7 \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-arm64v8 \
	  bltavares/zerotier:$(ZEROTIER_VERSION)-ppc64le

	docker buildx imagetools create \
	  --tag bltavares/zerotier:latest \
	  bltavares/zerotier:amd64 \
	  bltavares/zerotier:i386 \
	  bltavares/zerotier:arm32v7 \
	  bltavares/zerotier:arm64v8 \
	  bltavares/zerotier:ppc64le

all: amd64 x86 arm64 armhf ppc64le

.PHONY: all arm64 armhf amd64 x86 ppc64le publish manifest
