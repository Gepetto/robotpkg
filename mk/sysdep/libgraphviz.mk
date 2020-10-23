# robotpkg sysdep/libgraphvis.mk
# Created:			Guilhem Saurel on Oct 23 2020

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBGRAPHVIZ_DEPEND_MK:=	${LIBGRAPHVIZ_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libgraphviz
endif

ifeq (+,$(LIBGRAPHVIZ_DEPEND_MK)) # ----------------------------------------

PREFER.libgraphviz?=	system

DEPEND_USE+=		libgraphviz
DEPEND_ABI.libgraphviz?=libgraphviz>=2.30.0

SYSTEM_SEARCH.libgraphviz=\
  'include/graphviz/graphviz_version.h:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/libcgraph.so'							\
  'lib/pkgconfig/libcgraph.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Debian.libgraphviz=	"libgraphviz-dev"
SYSTEM_PKG.NetBSD.graphviz=	"pkgsrc/graphics/graphviz"

endif # LIBGRAPHVIZ_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
