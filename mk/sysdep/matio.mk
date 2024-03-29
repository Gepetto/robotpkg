# robotpkg sysdep/matio.mk
# Created:			Guilhem Saurel on Mon, 29 Aug 2022
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
MATIO_DEPEND_MK:=		${MATIO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			matio
endif

ifeq (+,$(MATIO_DEPEND_MK)) # ------------------------------------------

# TODO: system is available, we just need to install it on the buildfarm
PREFER.matio?=			system

SYSTEM_SEARCH.matio=\
  'include/matio_pubconf.h:/MATIO_VERSION_STR /s/[^0-9.]//gp'		\
  'lib/libmatio.so'

DEPEND_USE+=			matio

DEPEND_ABI.matio?=		matio>=1.5.17

SYSTEM_PKG.Arch.matio=		libmatio
SYSTEM_PKG.Debian.matio=	libmatio-dev
SYSTEM_PKG.NetBSD.matio=	devel/matio
SYSTEM_PKG.RedHat.matio=	matio-devel

endif # MATIO_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
