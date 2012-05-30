# robotpkg sysdep/libavdevice.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBAVDEVICE_DEPEND_MK:=	${LIBAVDEVICE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavdevice
endif

ifeq (+,$(LIBAVDEVICE_DEPEND_MK)) # ----------------------------------------

PREFER.libavdevice?=		system
DEPEND_USE+=			libavdevice
DEPEND_ABI.libavdevice?=	libavdevice>=52

SYSTEM_SEARCH.libavdevice=\
	'include/{,ffmpeg/}libavdevice/avdevice.h'		\
	'lib/libavdevice.{so,a}'				\
	'lib/pkgconfig/libavdevice.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libavdevice=ffmpeg-libs
SYSTEM_PKG.Ubuntu.libavdevice=libavdevice-dev
SYSTEM_PKG.Debian.libavdevice=libavdevice-dev
SYSTEM_PKG.NetBSD.libavdevice=multimedia/ffmpeg

endif # LIBAVDEVICE_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
