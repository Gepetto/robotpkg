# robotpkg depend.mk for:	interfaces/openrobots-idl
# Created:			Anthony Mallet on Mon,  9 Nov 2015
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OPENROBOTS_IDL_DEPEND_MK:=	${OPENROBOTS_IDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openrobots-idl
endif

ifeq (+,$(OPENROBOTS_IDL_DEPEND_MK)) # -------------------------------------

DEPEND_USE+=		openrobots-idl
PREFER.openrobots-idl?=	robotpkg

SYSTEM_SEARCH.openrobots-idl=\
	'share/idl/openrobots1-idl/or/time/time.idl'			\
	'lib/pkgconfig/openrobots-idl.pc:/Version/s/[^0-9.]//gp'

DEPEND_ABI.openrobots-idl?=	openrobots-idl>=1.6
DEPEND_DIR.openrobots-idl?=	../../interfaces/openrobots-idl

endif # OPENROBOTS_IDL_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
