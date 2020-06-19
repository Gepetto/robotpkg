# robotpkg depend.mk for:	graphics/openscenegraph
# Created:			Guilhem Saurel on Mon, 25 May 2020
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OPENSCENEGRAPH_DEPEND_MK:=	${OPENSCENEGRAPH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			openscenegraph
endif

ifeq (+,$(OPENSCENEGRAPH_DEPEND_MK)) # -------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (CentOS,${OPSYS})
  PREFER.openscenegraph?=	robotpkg
else ifeq (NetBSD,${OPSYS})
  PREFER.openscenegraph?=	robotpkg
endif
PREFER.openscenegraph?=		system

DEPEND_USE+=			openscenegraph
DEPEND_ABI.openscenegraph?=	openscenegraph>=3
DEPEND_DIR.openscenegraph?=	../../graphics/openscenegraph

SYSTEM_SEARCH.openscenegraph=\
  'include/osg/Object'						\
  'lib/libosg.so'						\
  'lib/pkgconfig/openscenegraph.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.openscenegraph=	libopenscenegraph-dev
SYSTEM_PKG.Arch.openscenegraph=		openscenegraph

endif # OPENSCENEGRAPH_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
