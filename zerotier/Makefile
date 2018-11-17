ZEROTIER_VERSION = "1.2.12"

define build_image
  docker build . \
    --tag bltavares/zerotier:$(2) \
	--build-arg ZEROTIER_VERSION=$(ZEROTIER_VERSION) \
	--build-arg BUILDER_ARCH=$(1) \
	--build-arg TARGET_ARCH=$(2)
endef

amd64:
	$(call build_image,amd64,amd64)

x86:
	$(call build_image,i386,i386)

arm64:
	$(call build_image,arm64v8,arm64v8)

armhf:
	$(call build_image,arm32v7,arm32v6)

armel:
	docker build . \
	  --tag bltavares/zerotier:arm32v5 \
	  --build-arg ZEROTIER_VERSION=$(ZEROTIER_VERSION) \
	  -f Dockerfile.armel

ppc64le:
	$(call build_image,ppc64le,ppc64le)

publish:
	docker push bltavares/zerotier:amd64
	docker push bltavares/zerotier:i386
	docker push bltavares/zerotier:arm32v5
	docker push bltavares/zerotier:arm32v6
	docker push bltavares/zerotier:arm64v8
	docker push bltavares/zerotier:ppc64le

manifest:
	docker manifest create --amend \
	  bltavares/zerotier:latest \
	  bltavares/zerotier:amd64 \
	  bltavares/zerotier:i386 \
	  bltavares/zerotier:arm32v5 \
	  bltavares/zerotier:arm32v6 \
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
	  bltavares/zerotier:arm32v6 --os linux \
	  --arch arm --variant v6
	
	docker manifest annotate bltavares/zerotier:latest \
	  bltavares/zerotier:arm64v8 --os linux \
	  --arch arm64
	
	docker manifest annotate bltavares/zerotier:latest \
	  bltavares/zerotier:ppc64le --os linux \
	  --arch ppc64le

	docker manifest push bltavares/zerotier:latest

all: amd64 x86 arm64 armel armhf ppc64le

.PHOINY: all arm64 armel armhf amd64 x86 ppc64le publish manifest