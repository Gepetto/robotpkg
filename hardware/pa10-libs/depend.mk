# robotpkg depend.mk for:	hardware/pa10-libs
# Created:			Xavier Broquere on Thu, 12 Mar 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PA10LIBS_DEPEND_MK:=	${PA10LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pa10-libs
endif

ifeq (+,$(PA10LIBS_DEPEND_MK)) # -------------------------------------
PREFER.pa10-libs?=	robotpkg

DEPEND_USE+=		pa10-libs

DEPEND_ABI.pa10-libs?=	pa10-libs>=1.1
DEPEND_DIR.pa10-libs?=	../../hardware/pa10-libs

SYSTEM_SEARCH.pa10-libs=\
	include/pa10-libs/pa.h    				\
	'lib/pkgconfig/pa10-libs.pc:/Version/s/[^0-9.]//gp' 	\
	lib/libpapci.a

endif # PA10LIBS_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
