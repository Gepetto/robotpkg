#
# Makefile for the Linux IEEE 1394 implementation
#

KDIR    := /lib/modules/$(shell uname -r)/build
IDIR    := /lib/modules/$(shell uname -r)/kernel/drivers/char
PWD     :=  $(shell pwd)

ieee1394-objs := ieee1394_core.o ieee1394_transactions.o hosts.o \
		 highlevel.o csr.o nodemgr.o dma.o iso.o \
		 csr1212.o config_roms.o

obj-m += ieee1394.o
obj-m += ohci1394.o
obj-m += video1394.o
obj-m += raw1394.o

#obj-m += init_ohci1394_dma.o


all:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

install:
	install -c -m 744 ieee1394.ko $(PREFIX)/$(IDIR)
	install -c -m 744 ohci1394.ko $(PREFIX)/$(IDIR)
	install -c -m 744 video1394.ko $(PREFIX)/$(IDIR)
	install -c -m 744 raw1394.ko $(PREFIX)/$(IDIR)

clean:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean

.PHONY:
	install
