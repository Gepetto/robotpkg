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
	'include/{,ffmpeg*/}libavformat/avformat.h'		\
	'lib/{,ffmpeg*/}libavformat.{so,a}'				\
	'lib/{,ffmpeg*/}pkgconfig/libavformat.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libavformat=ffmpeg-devel
SYSTEM_DEP.Debian.libavformat=libavformat-dev (>=4:0.5)
SYSTEM_PKG.NetBSD.libavformat=multimedia/ffmpeg

endif # LIBAVFORMAT_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
