# robotpkg depend.mk for:	libogre
# Created:			Charles Lesire on 30 Apr 2014
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBOGRE_DEPEND_MK:=	${LIBOGRE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libogre
endif

ifeq (+,$(LIBOGRE_DEPEND_MK)) # ---------------------------------------------

PREFER.libogre?=	system
DEPEND_USE+=		libogre
DEPEND_ABI.libogre?=	libogre>=1.0

SYSTEM_SEARCH.libogre=\
  'include/OGRE/Ogre.h'					\
  'lib/libOgreMain.so'					\
  'lib/pkgconfig/OGRE.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libogre=ogre-devel
SYSTEM_PKG.Ubuntu.libogre=libogre-dev
SYSTEM_PKG.Debian.libogre=libogre-dev
SYSTEM_PKG.NetBSD.libogre=devel/ogre

endif # LIBOGRE_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
