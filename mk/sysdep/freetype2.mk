# robotpkg sysdep/freetype2.mk
# Created:			Anthony Mallet on Fri,  6 May 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FREETYPE2_DEPEND_MK:=	${FREETYPE2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		freetype2
endif

ifeq (+,$(FREETYPE2_DEPEND_MK)) # ------------------------------------------

PREFER.freetype2?=	system

DEPEND_USE+=		freetype2

DEPEND_ABI.freetype2?=	freetype2>=2

SYSTEM_SEARCH.freetype2=\
	'bin/freetype-config::% --ftversion'			\
	'include/freetype2/freetype/freetype.h'			\
	'lib/libfreetype.{so,a}'				\
	'lib/pkgconfig/freetype2.pc' # .pc contains a strange version

SYSTEM_PKG.Fedora.freetype2=	freetype-devel
SYSTEM_PKG.Ubuntu.freetype2=	libfreetype6-dev
SYSTEM_PKG.Debian.freetype2=	libfreetype6-dev
SYSTEM_PKG.NetBSD.freetype2=		pkgsrc/graphics/freetype2

endif # FREETYPE2_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
