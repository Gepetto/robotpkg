# robotpkg sysdep/flex.mk
# Created:			Anthony Mallet on Fri Oct 24 2008
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FLEX_DEPEND_MK:=	${FLEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		flex
endif

ifeq (+,$(FLEX_DEPEND_MK)) # -----------------------------------------

PREFER.flex?=		system
DEPEND_USE+=		flex
DEPEND_ABI.flex?=	flex>=2.5
DEPEND_METHOD.flex+=	build

SYSTEM_SEARCH.flex=\
	'bin/flex:s/[^.0-9]//gp:% -V'		\
	'lib/libfl.{a,so}'

SYSTEM_PKG.Debian.flex=	flex
SYSTEM_PKG.Fedora.flex=	flex flex-static
SYSTEM_PKG.Ubuntu.flex=	flex
SYSTEM_PKG.NetBSD.flex=	devel/flex

export FLEX=		$(word 1,${SYSTEM_FILES.flex})
CONFIGURE_ENV+=		LEX=${FLEX}

endif # FLEX_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
