# robotpkg depend.mk for:	devel/ycm
# Created:			Anthony Mallet on Thu, 10 Dec 2020
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
YCM_DEPEND_MK:=		${YCM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ycm
endif

ifeq (+,$(YCM_DEPEND_MK)) # ------------------------------------------------

PREFER.ycm?=		robotpkg

DEPEND_USE+=		ycm
DEPEND_ABI.ycm?=	ycm>=0.11
DEPEND_DIR.ycm?=	../../devel/ycm

SYSTEM_SEARCH.ycm=\
  'share/cmake/YCM/YCMConfig.cmake:/YCM_VERSION /s/[^.0-9]//gp'

endif # YCM_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
