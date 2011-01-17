# robotpkg sysdep/bash.mk
# Created:			Anthony Mallet on Sat, 16 Jan 2011
#

# Bash is an sh-compatible shell that incorporates useful features from
# the Korn shell (ksh) and C shell (csh). It is intended to conform to
# the IEEE POSIX P1003.2/ISO 9945.2 Shell and Tools standard.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BASH_DEPEND_MK:=	${BASH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		bash
endif

ifeq (+,$(BASH_DEPEND_MK)) # -----------------------------------------------

PREFER.bash?=		system
DEPEND_USE+=		bash
DEPEND_ABI.bash?=	bash

SYSTEM_SEARCH.bash=	\
	'bin/bash:1s/[^0-9]*\([0-9.]*\).*/\1/p:% --version'

export BASH=	$(word 1,${SYSTEM_FILES.bash})

endif # BASH_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
