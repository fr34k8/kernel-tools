CONFIG ?=	.config-3.18-std
KERNEL ?=	$(shell echo $(CONFIG) | cut -d- -f2)
NAME ?=		moul/kernel-builder:$(KERNEL)-cross-armhf


run:
	docker run -it --rm -v $(PWD)/$(CONFIG):/usr/src/linux/.config $(NAME) /bin/bash


menuconfig:
	docker run -it --rm -v $(PWD)/$(CONFIG):/usr/src/linux/.config $(NAME) make menuconfig


build:
	mkdir -p build
	docker run -it --rm -v $(PWD)/$(CONFIG):/usr/src/linux/.config -v $(PWD)/build:/usr/src/linux/build/ $(NAME) make uImage
