# robotpkg depend.mk for:	architecture/genom3-pocolibs
# Created:			Anthony Mallet on Mon, 9 Nov 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOM3_POCOLIBS_DEPEND_MK:=	${GENOM3_POCOLIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genom3-pocolibs
endif

ifeq (+,$(GENOM3_POCOLIBS_DEPEND_MK)) # ------------------------------------

DEPEND_USE+=		genom3-pocolibs
PREFER.genom3-pocolibs?=robotpkg

SYSTEM_SEARCH.genom3-pocolibs=\
	lib/libpocolibs-client.so				\
	'lib/pkgconfig/genom3-pocolibs.pc:/Version/s/[^0-9.]//gp'

DEPEND_ABI.genom3-pocolibs?=	genom3-pocolibs>=1.23
DEPEND_DIR.genom3-pocolibs?=	../../architecture/genom3-pocolibs

include ../../mk/language/c11.mk

endif # GENOM3_POCOLIBS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
