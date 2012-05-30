# robotpkg sysdep/libavfilter.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBAVFILTER_DEPEND_MK:=	${LIBAVFILTER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavfilter
endif

ifeq (+,$(LIBAVFILTER_DEPEND_MK)) # ----------------------------------------

PREFER.libavfilter?=		system
DEPEND_USE+=			libavfilter
DEPEND_ABI.libavfilter?=	libavfilter>=1

SYSTEM_SEARCH.libavfilter=\
	'include/{,ffmpeg/}libavfilter/avfilter.h'		\
	'lib/libavfilter.{so,a}'				\
	'lib/pkgconfig/libavfilter.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libavfilter=ffmpeg-libs
SYSTEM_PKG.Ubuntu.libavfilter=libavfilter-dev
SYSTEM_PKG.Debian.libavfilter=libavfilter-dev
SYSTEM_PKG.NetBSD.libavfilter=multimedia/ffmpeg

endif # LIBAVFILTER_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
