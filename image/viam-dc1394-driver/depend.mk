# robotpkg depend.mk for:	image/viam-dc1394-driver
# Created:			Anthony Mallet on Fri, 28 Oct 2011
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
VIAM_DC1394_DRIVER_DEPEND_MK:=	${VIAM_DC1394_DRIVER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			viam-dc1394-driver
endif

ifeq (+,$(VIAM_DC1394_DRIVER_DEPEND_MK)) # ---------------------------------

PREFER.viam-dc1394-driver?=	robotpkg

DEPEND_USE+=			viam-dc1394-driver

DEPEND_ABI.viam-dc1394-driver?=	viam-dc1394-driver>=1.10
DEPEND_DIR.viam-dc1394-driver?=	../../image/viam-dc1394-driver

SYSTEM_SEARCH.viam-dc1394-driver=\
	lib/viam-drivers/dc1394.{a,so}

endif # VIAM_DC1394_DRIVER_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
