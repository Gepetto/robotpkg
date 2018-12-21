# robotpkg depend.mk for:	robots/romeo-description
# Created:			Aurélie Clodic on Wed, 10 Jun 2014
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROMEO_DESCRIPTION_DEPEND_MK:=	${ROMEO_DESCRIPTION_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		romeo-description
endif

ifeq (+,${ROMEO_DESCRIPTION_DEPEND_MK}) # ----------------------------------

PREFER.romeo-description?=	robotpkg

DEPEND_USE+=		romeo-description

DEPEND_ABI.romeo-description?=	romeo-description>=0.4.0
DEPEND_DIR.romeo-description?=	../../robots/romeo-description

SYSTEM_SEARCH.romeo-description=\
  'lib/pkgconfig/romeo_description.pc:/Version/s/[^0-9.]//gp'

endif # ROMEO_DESCRIPTION_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
