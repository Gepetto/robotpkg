# robotpkg depend.mk for:	path/walk-genom
# Created:			Anthony Mallet on Wed, 24 Mar 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
WALK_GENOM_DEPEND_MK:=	${WALK_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		walk-genom
endif

ifeq (+,$(WALK_GENOM_DEPEND_MK)) # -----------------------------------------

PREFER.walk-genom?=	robotpkg

DEPEND_USE+=		walk-genom

DEPEND_ABI.walk-genom?=	walk-genom>=1.5
DEPEND_DIR.walk-genom?=	../../path/walk-genom

SYSTEM_SEARCH.walk-genom=\
	include/walk/walkStruct.h					\
	'lib/pkgconfig/walk.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

