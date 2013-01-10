# robotpkg Makefile for:	graphics/grh2
# Created:			Matthieu Herrb on Tue, 14 Apr 2009
#

DISTNAME=		grh2-2.1
PKGREVISION=		2
CATEGORIES=		graphics
COMMENT=		2D graphical interface for Hilare 2 robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=grh2/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/grh2

LICENSE=	isc
MAINTAINER=	matthieu.herrb@laas.fr

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=--with-tk=$(dir ${TK_CONFIG_SH})

include ../../devel/mkdep/depend.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/sysdep/bwidget.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
