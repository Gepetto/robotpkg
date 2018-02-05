# robotpkg sysdep/automake.mk
# Created:			Anthony Mallet on Tue, 28 Sep 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
AUTOMAKE_DEPEND_MK:=	${AUTOMAKE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		automake
endif

ifeq (+,$(AUTOMAKE_DEPEND_MK)) # -------------------------------------------

PREFER.automake?=	system

DEPEND_USE+=		automake
DEPEND_ABI.automake?=	automake>=1.8
DEPEND_METHOD.automake?=build
SYSTEM_SEARCH.automake=\
	'bin/aclocal:/aclocal/{s/[^0-9.]//gp;q;}:% --version'	\
	'bin/automake:/automake/{s/[^0-9.]//gp;q;}:% --version'

export ACLOCAL=		$(word 1,${SYSTEM_FILES.automake})
export AUTOMAKE=	$(word 2,${SYSTEM_FILES.automake})

GNU_CONFIGURE?=		yes

include ../../mk/sysdep/gm4.mk

endif # AUTOMAKE_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
