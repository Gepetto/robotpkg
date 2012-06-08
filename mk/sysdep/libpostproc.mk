# robotpkg sysdep/libpostproc.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBPOSTPROC_DEPEND_MK:=	${LIBPOSTPROC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libpostproc
endif

ifeq (+,$(LIBPOSTPROC_DEPEND_MK)) # ----------------------------------------

PREFER.libpostproc?=		system
DEPEND_USE+=			libpostproc
DEPEND_ABI.libpostproc?=	libpostproc>=51

SYSTEM_SEARCH.libpostproc=\
	'include/{,ffmpeg/}libpostproc/postprocess.h'		\
	'lib/libpostproc.{so,a}'				\
	'lib/pkgconfig/libpostproc.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libpostproc=ffmpeg-devel
SYSTEM_PKG.Ubuntu.libpostproc=libpostproc-dev
SYSTEM_PKG.Debian.libpostproc=libpostproc-dev
SYSTEM_PKG.NetBSD.libpostproc=multimedia/ffmpeg

endif # LIBPOSTPROC_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
