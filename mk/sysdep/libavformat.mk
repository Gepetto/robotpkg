# robotpkg sysdep/libavformat.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBAVFORMAT_DEPEND_MK:=	${LIBAVFORMAT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavformat
endif

ifeq (+,$(LIBAVFORMAT_DEPEND_MK)) # ----------------------------------------

PREFER.libavformat?=		system
DEPEND_USE+=			libavformat
DEPEND_ABI.libavformat?=	libavformat>=52

SYSTEM_SEARCH.libavformat=\
	'include/{,ffmpeg/}libavformat/avformat.h'		\
	'lib/libavformat.{so,a}'				\
	'lib/pkgconfig/libavformat.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libavformat=ffmpeg-libs
SYSTEM_PKG.Ubuntu.libavformat=libavformat-dev
SYSTEM_PKG.Debian.libavformat=libavformat-dev
SYSTEM_PKG.NetBSD.libavformat=multimedia/ffmpeg

endif # LIBAVFORMAT_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
