# robotpkg depend.mk for:	interfaces/openrobots2-idl
# Created:			Anthony Mallet on Tue, 21 Aug 2018
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OPENROBOTS2_IDL_DEPEND_MK:=	${OPENROBOTS2_IDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openrobots2-idl
endif

ifeq (+,$(OPENROBOTS2_IDL_DEPEND_MK)) # ------------------------------------

DEPEND_USE+=		openrobots2-idl
PREFER.openrobots2-idl?=robotpkg

SYSTEM_SEARCH.openrobots2-idl=\
	'share/idl/openrobots2-idl/or/time/time.idl'			\
	'lib/pkgconfig/openrobots2-idl.pc:/Version/s/[^0-9.]//gp'

DEPEND_ABI.openrobots2-idl?=	openrobots2-idl>=2.0
DEPEND_DIR.openrobots2-idl?=	../../interfaces/openrobots2-idl

endif # OPENROBOTS2_IDL_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
