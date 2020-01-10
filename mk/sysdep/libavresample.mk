# robotpkg sysdep/libavresample.mk
# Created:			Anthony Mallet on Wed 12 Sep 2018
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
LIBAVRESAMPLE_DEPEND_MK:=	${LIBAVRESAMPLE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavresample
endif

ifeq (+,$(LIBAVRESAMPLE_DEPEND_MK)) # --------------------------------------

PREFER.libavresample?=		system
DEPEND_USE+=			libavresample
DEPEND_ABI.libavresample?=	libavresample>=1

SYSTEM_SEARCH.libavresample=\
  'include/{,ffmpeg*/}libavresample/avresample.h'			\
  'lib/{,ffmpeg*/}libavresample.{so,a}'					\
  'lib/{,ffmpeg*/}pkgconfig/libavresample.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libavresample=ffmpeg-devel
SYSTEM_DEP.Debian.libavresample=libavresample-dev (>= 6:9.11)
SYSTEM_PKG.NetBSD.libavresample=multimedia/ffmpeg

endif # LIBAVRESAMPLE_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
