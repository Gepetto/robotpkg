# robotpkg sysdep/apt.mk
# Created:			Anthony Mallet on Wed, 25 Aug 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
APT_DEPEND_MK:=		${APT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		apt
endif

ifeq (+,$(APT_DEPEND_MK)) # ------------------------------------------------

PREFER.apt?=		system

DEPEND_USE+=		apt
DEPEND_METHOD.apt?=	build
DEPEND_ABI.apt?=	apt>=0

SYSTEM_SEARCH.apt=	\
	'bin/apt-get:1{s/[^0-9]*//;s/[^0-9.].*//;p;}:% --version'

SYSTEM_PKG.Linux.apt=	apt

endif # APT_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
