# robotpkg depend.mk for:	manipulation/coldman-genom
# Created:			Anthony Mallet on Fri, 15 Oct 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
COLDMAN-GENOM_DEPEND_MK:=	${COLDMAN-GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		coldman-genom
endif

ifeq (+,$(COLDMAN-GENOM_DEPEND_MK)) # ----------------------------------

PREFER.coldman-genom?=	robotpkg

SYSTEM_SEARCH.coldman-genom=\
	bin/coldman			\
	include/coldman/coldmanStruct.h		\
	'lib/pkgconfig/coldman.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		coldman-genom

DEPEND_ABI.coldman-genom?=coldman-genom>=1.3
DEPEND_DIR.coldman-genom?=../../graphics/coldman-genom

endif # COLDMAN-GENOM_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
