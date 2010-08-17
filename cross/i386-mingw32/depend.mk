# robotpkg depend.mk for:	lang/cross-i386-mingw32
# Created:			Anthony Mallet on Tue, 15 Jul 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
I386_MINGW32_DEPEND_MK:=${I386_MINGW32_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		cross-i386-mingw32
endif

ifeq (+,$(I386_MINGW32_DEPEND_MK)) # ---------------------------------
PREFER.cross-i386-mingw32?=	robotpkg

DEPEND_USE+=			cross-i386-mingw32
DEPEND_METHOD.cross-i386-mingw32+=	build

DEPEND_ABI.cross-i386-mingw32?=	cross-i386-mingw32>=3.14
DEPEND_DIR.cross-i386-mingw32?=	../../cross/i386-mingw32

MINGW_SUBPREFIX=	i386-mingw32
MINGW_PREFIX=		${LOCALBASE}/${MINGW_SUBPREFIX}

ROBOTPKG_CC+=	${LOCALBASE}/cross/bin/i386-mingw32-gcc
ROBOTPKG_CXX=	${LOCALBASE}/cross/bin/i386-mingw32-g++

ifdef GNU_CONFIGURE
  CONFIGURE_ARGS+=	--host=i386-mingw32
endif # GNU_CONFIGURE

endif # I386_MINGW32_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
