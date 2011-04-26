# robotpkg depend.mk for:	net/tclserv
# Created:			Anthony Mallet on Tue, 26 Apr 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TCLSERV_DEPEND_MK:=	${TCLSERV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tclserv
endif

ifeq (+,$(TCLSERV_DEPEND_MK)) # --------------------------------------------

PREFER.tclserv?=	robotpkg

SYSTEM_SEARCH.tclserv=	'bin/tclserv:s/[^0-9.]//gp:% --version'

DEPEND_USE+=		tclserv
DEPEND_ABI.tclserv?=	tclserv>=2.7
DEPEND_DIR.tclserv?=	../../net/tclserv

endif # TCLSERV_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
