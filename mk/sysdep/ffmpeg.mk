# robotpkg depend.mk for:	sysdep/ffmpeg
# Created:			Guilhem Saurel on Mon, 17 May 2021
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FFMPEG_DEPEND_MK:=	${FFMPEG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ffmpeg
endif

ifeq (+,$(FFMPEG_DEPEND_MK)) # -----------------------------------------------

PREFER.ffmpeg?=	system

DEPEND_USE+=		ffmpeg
DEPEND_ABI.ffmpeg?=	ffmpeg>=2.8

SYSTEM_SEARCH.ffmpeg=\
  'bin/ffmpeg{,[0-9]}:/ffmpeg version[^0-9]*/{s///;s/[^0-9.].*//p;}'

endif # FFMPEG_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
