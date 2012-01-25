# robotpkg depend.mk for:	math/gbM
# Created:			Xavier Broquere on Wed, 11 Mar 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GBM_DEPEND_MK:=	${GBM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gbM
endif

ifeq (+,$(GBM_DEPEND_MK)) # -------------------------------------
PREFER.gbM?=	robotpkg

DEPEND_USE+=		gbM

DEPEND_ABI.gbM?=	gbM>=0.9
DEPEND_DIR.gbM?=	../../math/gbM

SYSTEM_SEARCH.gbM=\
	include/gbM/Proto_gb.h \
	include/gbM/Proto_gbModeles.h \
	include/gbM/gb.h \
	include/gbM/gbGENOM.h \
	include/gbM/gbStruct.h \
	lib/pkgconfig/gbM.pc

endif # GBM_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
