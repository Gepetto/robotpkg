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
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04 12.10 13.04,${OS_VERSION}))
    PREFER.urdfdom?=	robotpkg
  else
    PREFER.urdfdom?=	system
  endif
endif
PREFER.urdfdom?=	robotpkg

DEPEND_USE+=		urdfdom

DEPEND_ABI.urdfdom?=	urdfdom>=0.2.8
DEPEND_DIR.urdfdom?=	../../graphics/urdfdom

SYSTEM_SEARCH.urdfdom=\
  'include/urdf_parser/urdf_parser.h'				\
  'lib/liburdfdom_model.so'					\
  'lib/pkgconfig/urdfdom.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.urdfdom=liburdfdom-dev

endif # URDFDOM_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
