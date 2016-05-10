# robotpkg depend.mk for:	hardware/daqflex-libs
# Created:			Matthieu Herrb on Thu, 16 May 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
DAQFLEX_LIBS_DEPEND_MK:=${DAQFLEX_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		daqflex-libs
endif

ifeq (+,$(DAQFLEX_LIBS_DEPEND_MK)) # ---------------------------------------

PREFER.daqflex-libs?=	robotpkg

DEPEND_USE+=		daqflex-libs

DEPEND_ABI.daqflex-libs?=	daqflex-libs>=0.1
DEPEND_DIR.daqflex-libs?=	../../hardware/daqflex-libs

SYSTEM_SEARCH.daqflex-libs=\
 'bin/daqflexTest'					\
 'include/daqflex/daqflex.h'				\
 'lib/pkgconfig/daqflex-libs.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
