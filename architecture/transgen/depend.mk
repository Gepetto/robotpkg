# robotpkg depend.mk for:	architecture/transgen
# Created:			Anthony Mallet on Thu, 12 Mar 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TRANSGEN_DEPEND_MK:=	${TRANSGEN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		transgen
endif

ifeq (+,$(TRANSGEN_DEPEND_MK)) # -------------------------------------------

PREFER.transgen?=	robotpkg

DEPEND_USE+=		transgen

DEPEND_ABI.transgen?=	transgen>=1.0b1
DEPEND_DIR.transgen?=	../../architecture/transgen

SYSTEM_SEARCH.transgen=\
	bin/transgen			\
	include/transgen/oprs-com.h	\
	lib/pkgconfig/transgen.pc	\
	lib/liboprs-com.a

export TRANSGEN?=	${PREFIX.transgen}/bin/transgen

endif # TRANSGEN_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
