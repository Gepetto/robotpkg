# robotpkg sysdep/libavutil.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBAVUTIL_DEPEND_MK:=	${LIBAVUTIL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavutil
endif

ifeq (+,$(LIBAVUTIL_DEPEND_MK)) # ------------------------------------------

PREFER.libavutil?=		system
DEPEND_USE+=			libavutil
DEPEND_ABI.libavutil?=		libavutil>=49

SYSTEM_SEARCH.libavutil=\
	'include/{,ffmpeg/}libavutil/avutil.h'			\
	'lib/libavutil.{so,a}'					\
	'lib/pkgconfig/libavutil.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libavutil=ffmpeg-libs
SYSTEM_PKG.Ubuntu.libavutil=libavutil-dev
SYSTEM_PKG.Debian.libavutil=libavutil-dev
SYSTEM_PKG.NetBSD.libavutil=multimedia/ffmpeg

endif # LIBAVUTIL_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
