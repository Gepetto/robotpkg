# robotpkg sysdep/libswscale.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSWSCALE_DEPEND_MK:=	${LIBSWSCALE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libswscale
endif

ifeq (+,$(LIBSWSCALE_DEPEND_MK)) # -----------------------------------------

PREFER.libswscale?=		system
DEPEND_USE+=			libswscale
DEPEND_ABI.libswscale?=		libswscale>=0

SYSTEM_SEARCH.libswscale=\
	include/libswscale/swscale.h			\
	'lib/libswscale.{so,a}'				\
	'lib/pkgconfig/libswscale.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libswscale=ffmpeg-libs
SYSTEM_PKG.Ubuntu.libswscale=libswscale-dev
SYSTEM_PKG.Debian.libswscale=libswscale-dev
SYSTEM_PKG.NetBSD.libswscale=multimedia/ffmpeg

endif # LIBSWSCALE_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
