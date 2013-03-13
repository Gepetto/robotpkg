# robotpkg sysdep/kernel.mk
# Created:			Matthieu Herrb on Fri, 28 Jan 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
KERNEL_DEPEND_MK:=	${KERNEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		kernel
endif

ifeq (+,$(KERNEL_DEPEND_MK)) # ---------------------------------------------

PREFER.kernel?=		system

DEPEND_USE+=		kernel
DEPEND_ABI.kernel?=	kernel>=2.6

SYSTEM_PKG.Fedora.kernel=kernel-devel-${OS_KERNEL_VERSION}
SYSTEM_PKG.Ubuntu.kernel=linux-headers-${OS_KERNEL_VERSION}

_syspath.kernel=lib/modules/${OS_KERNEL_VERSION}/build/
_v.kernel=/UTS_RELEASE/{s/[^\"]*//;s/\"//g;p;}
SYSTEM_SEARCH.kernel=\
  '${_syspath.kernel}/Kconfig'						\
  '${_syspath.kernel}/include/{,generated/}{,uapi/}linux/version.h'	\
  '${_syspath.kernel}/include/{linux,generated}/utsrelease.h:${_v.kernel}'


endif # KERNEL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
