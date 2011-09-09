# robotpkg depend.mk for:	image/libraw1394
# Created:			Anthony Mallet on Fri, 14 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBRAW1394_DEPEND_MK:=	${LIBRAW1394_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libraw1394
endif

ifeq (+,$(LIBRAW1394_DEPEND_MK)) # -----------------------------------------

PREFER.libraw1394?=	system

DEPEND_USE+=		libraw1394

DEPEND_ABI.libraw1394?=	libraw1394>=1.3.0
DEPEND_DIR.libraw1394?=	../../image/libraw1394

SYSTEM_PKG.Fedora.libraw1394=libraw1394-devel
SYSTEM_PKG.Ubuntu.libraw1394=libraw1394-dev
SYSTEM_PKG.Debian.libraw1394=libraw1394-dev

SYSTEM_SEARCH.libraw1394=\
	include/libraw1394/raw1394.h				\
	'lib/pkgconfig/libraw1394.pc:/Version/s/[^0-9.]//gp'

endif # LIBRAW1394_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
