# robotpkg depend.mk for:	graphics/urdfdom
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
URDFDOM_DEPEND_MK:=	${URDFDOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		urdfdom
endif

ifeq (+,$(URDFDOM_DEPEND_MK)) # --------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (NetBSD,${OPSYS})
  PREFER.urdfdom?=	robotpkg
endif
PREFER.urdfdom?=	system

DEPEND_USE+=		urdfdom

DEPEND_ABI.urdfdom?=	urdfdom>=0.2.8
DEPEND_DIR.urdfdom?=	../../graphics/urdfdom

SYSTEM_SEARCH.urdfdom=\
  'include/{urdfdom/,}urdf_parser/urdf_parser.h'		\
  'lib/liburdfdom_model.so'					\
  'lib/pkgconfig/urdfdom.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.urdfdom=liburdfdom-dev
SYSTEM_PKG.Fedora.urdfdom=urdfdom-devel

# urdl_parser.h leaks a dependency on tinyxml
include ../../devel/tinyxml/depend.mk

INCLUDE_DIRS.tinyxml?=	$(dir $(filter %/tinyxml.h,${SYSTEM_FILES.tinyxml}))
LIBRARY_DIRS.tinyxml?=	$(dir $(filter %/libtinyxml.so,${SYSTEM_FILES.tinyxml}))
RPATH_DIRS.tinyxml?=	${LIBRARY_DIRS.tinyxml}

endif # URDFDOM_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
