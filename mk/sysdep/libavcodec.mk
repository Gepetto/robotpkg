# robotpkg sysdep/libavcodec.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBAVCODEC_DEPEND_MK:=	${LIBAVCODEC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavcodec
endif

ifeq (+,$(LIBAVCODEC_DEPEND_MK)) # -----------------------------------------

PREFER.libavcodec?=		system
DEPEND_USE+=			libavcodec
DEPEND_ABI.libavcodec?=		libavcodec>=52

SYSTEM_SEARCH.libavcodec=\
	'include/{,ffmpeg/}libavcodec/avcodec.h'		\
	'lib/libavcodec.{so,a}'					\
	'lib/pkgconfig/libavcodec.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libavcodec=ffmpeg-libs
SYSTEM_PKG.Ubuntu.libavcodec=libavcodec-dev
SYSTEM_PKG.Debian.libavcodec=libavcodec-dev
SYSTEM_PKG.NetBSD.libavcodec=multimedia/ffmpeg

endif # LIBAVCODEC_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
