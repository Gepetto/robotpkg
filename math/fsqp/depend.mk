# robotpkg depend.mk for:	math/fsqp
# Created:			florent on Wed, 14 Oct 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FSQP_DEPEND_MK:=	${FSQP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		fsqp
endif

ifeq (+,$(FSQP_DEPEND_MK)) # --------------------------------

PREFER.fsqp?=	robotpkg

DEPEND_USE+=		fsqp

SYSTEM_SEARCH.fsqp=\
	include/fsqp/cfsqpusr.h	\
	lib/pkgconfig/fsqp.pc

DEPEND_ABI.fsqp?=	fsqp>=2.5
DEPEND_DIR.fsqp?=	../../math/fsqp

endif # FSQP_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
