# robotpkg sysdep/tk.mk
# Created:			Anthony Mallet on Thu Oct 23 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TK_DEPEND_MK:=		${TK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tk
endif

ifeq (+,$(TK_DEPEND_MK)) # -------------------------------------------

include ../../mk/sysdep/tcl.mk

PREFER.tk?=		system

DEPEND_USE+=		tk

DEPEND_ABI.tk?=		tk>=8.4

SYSTEM_SEARCH.tk=	\
	'bin/wish{,[0-9]*}:{s/[^0-9.]//g;s/^$$/8.4/;p;}:echo %'		\
	'lib/{,tk{,[0-9.]*}/}tkConfig.sh:/TK_VERSION/s/[^.0-9]*//gp'	\
	'include/{,t{k,cl}{,[0-9.]*}/}tk.h:/TK_VERSION/s/[^.0-9]*//gp'

SYSTEM_PKG.Linux-fedore.tk=	tk-devel
SYSTEM_PKG.Ubuntu.tk=	tk-dev
SYSTEM_PKG.Debian.tk=	tk-dev
SYSTEM_PKG.NetBSD.tk=		pkgsrc/x11/tk

export WISH=		$(word 1,${SYSTEM_FILES.tk})
TK_CONFIG_SH=		$(word 2,${SYSTEM_FILES.tk})

endif # TK_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
