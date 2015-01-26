# robotpkg sysdep/qhull.mk
# Created:			Severin Lemaignan on Wed 1 Sep 2010
#

# Qhull is a general dimension convex hull program that reads a set
# of points from stdin, and outputs the smallest convex set that
# contains the points to stdout.  It also generates Delaunay
# triangulations, Voronoi diagrams, furthest-site Voronoi diagrams,
# and halfspace intersections about a point.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QHULL_DEPEND_MK:=	${QHULL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qhull
endif

ifeq (+,$(QHULL_DEPEND_MK)) # ----------------------------------------------

PREFER.qhull?=		system
DEPEND_USE+=		qhull
DEPEND_ABI.qhull?=	qhull

SYSTEM_SEARCH.qhull=	\
	include/{,lib}qhull/{,lib}qhull.h \
	lib/libqhull.so

SYSTEM_PKG.Fedora.qhull=qhull-devel
SYSTEM_PKG.Debian.qhull=libqhull-dev
SYSTEM_PKG.NetBSD.qhull=math/qhull

endif # QHULL_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
