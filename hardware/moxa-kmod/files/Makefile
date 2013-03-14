
obj-m	:= mxser.o

KDIR    := /lib/modules/$(shell uname -r)/build
IDIR    := /lib/modules/$(shell uname -r)/kernel/drivers/char
PWD     :=  $(shell pwd)

all:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

install:
	install -c -m 744 mxser.ko $(PREFIX)/$(KMOD_DIR)

clean:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean

.PHONY:
	install
