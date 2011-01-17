# robotpkg sysdep/apr-util.mk
# Created:		Anthony Mallet on Fri, 14 Jan 2011
#

# The Apache Portable Run-time mission is to provide a library of
# routines that allows programmers to write a program once and be
# able to compile it anywhere.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
APR_UTIL_DEPEND_MK:=	${APR_UTIL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		apr-util
endif

ifeq (+,$(APR_UTIL_DEPEND_MK)) # -------------------------------------------

PREFER.apr-util?=		system

DEPEND_USE+=		apr-util
DEPEND_ABI.apr-util?=	apr-util>=1

SYSTEM_SEARCH.apr-util=	\
	'bin/apu-1-config:p:% --version'	\
	'include/apr-1/apu.h'			\
	'lib/libaprutil-1.la'

SYSTEM_PKG.Linux-fedora.apr-util=	apr-util-devel
SYSTEM_PKG.NetBSD.apr-util=		pkgsrc/devel/apr-util

export APU_CONFIG=	$(word 1,${SYSTEM_FILES.apr-util})

endif # APR_UTIL_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
