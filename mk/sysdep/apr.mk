# robotpkg sysdep/apr.mk
# Created:			Anthony Mallet on Fri, 14 Jan 2011
#

# The Apache Portable Run-time mission is to provide a library of
# routines that allows programmers to write a program once and be
# able to compile it anywhere.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
APR_DEPEND_MK:=		${APR_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		apr
endif

ifeq (+,$(APR_DEPEND_MK)) # ------------------------------------------------

PREFER.apr?=		system

DEPEND_USE+=		apr
DEPEND_ABI.apr?=	apr>=1

SYSTEM_SEARCH.apr=	\
	'bin/apr-1-config:p:% --version'	\
	'include/apr-1*/apr.h'			\
	'lib/libapr-1.la'			\
	'lib/pkgconfig/apr-1.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.apr=	libapr1-dev
SYSTEM_PKG.Fedora.apr=	apr-devel
SYSTEM_PKG.NetBSD.apr=	devel/apr
SYSTEM_PKG.Ubuntu.apr=	libapr1-dev

export APR_CONFIG=	$(word 1,${SYSTEM_FILES.apr})

endif # APR_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
