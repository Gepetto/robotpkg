# robotpkg depend.mk for:	graphics/openscenegraph
# Created:			Guilhem Saurel on Mon, 25 May 2020
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OPENSCENEGRAPH_DEPEND_MK:=	${OPENSCENEGRAPH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			openscenegraph
endif

ifeq (+,$(OPENSCENEGRAPH_DEPEND_MK)) # -------------------------------------

# Depending packages require the collada plugin. Unfortunately, no distribution
# provides this in their system packages, so use a PREFER robotpkg by default.
#
# It might be better to provide a separate package just for the collada plugin,
# but it has to be assessed if a single plugin source would be compatible with
# diffent system osg versions. #264.
#
PREFER.openscenegraph?=		robotpkg

DEPEND_USE+=			openscenegraph
DEPEND_ABI.openscenegraph?=	openscenegraph>=3
DEPEND_DIR.openscenegraph?=	../../graphics/openscenegraph

# Make sure the collada plugin is found - this may be turned into a package
# option if needed.
SYSTEM_SEARCH.openscenegraph=\
  'include/osg/Object'							\
  'lib/libosg.so'							\
  'lib/osgPlugins-*/osgdb_dae.so:s@.*Plugins-\([0-9.]*\)/.*@\1@p:echo %'\
  'lib/pkgconfig/openscenegraph.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.openscenegraph=	libopenscenegraph-dev
SYSTEM_PKG.Arch.openscenegraph=		openscenegraph

endif # OPENSCENEGRAPH_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
