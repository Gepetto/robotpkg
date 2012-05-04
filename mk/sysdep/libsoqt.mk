# robotpkg sysdep/libsoqt.mk
# Created:			Anthony Mallet on Tue Feb  9 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSOQT_DEPEND_MK:=	${LIBSOQT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libsoqt
endif

ifeq (+,$(LIBSOQT_DEPEND_MK)) # --------------------------------------------

PREFER.libsoqt?=	system

DEPEND_USE+=		libsoqt

DEPEND_ABI.libsoqt?=	libsoqt>=1.4

SYSTEM_SEARCH.libsoqt=	\
 'include/{,Coin2}/Inventor/Qt/SoQtBasic.h:/SOQT_VERSION.*"/s/[^.0-9]//gp'	\
 'lib/libSoQt.{a,so}'

SYSTEM_PKG.Fedora.libsoqt=	SoQt-devel
SYSTEM_PKG.Ubuntu.libsoqt=	libsoqt-dev
SYSTEM_PKG.Debian.libsoqt=	libsoqt-dev

endif # LIBSOQT_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
