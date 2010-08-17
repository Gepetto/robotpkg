# robotpkg depend.mk for:	sysutils/tth
# Created:			Anthony Mallet on Tue, 13 Jan 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TTH_DEPEND_MK:=		${TTH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tth
endif

ifeq (+,$(TTH_DEPEND_MK)) # ------------------------------------------------

PREFER.tth?=		robotpkg

DEPEND_USE+=		tth

DEPEND_METHOD.tth?=	build
DEPEND_ABI.tth?=	tth>=3.85
DEPEND_DIR.tth?=	../../sysutils/tth

SYSTEM_SEARCH.tth=	\
	'bin/tth:/TtH.*Version/{s/(c).*$$//;s/[^0-9.]//gp;}:% -h'

export TTH=		${PREFIX.tth}/bin/tth

endif # TTH_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
