# robotpkg Makefile for:	sysutils/alog
# Created:			Matthieu Herrb on Mon, 12 Jan 2009
#

DISTNAME=	alog-0.5
COMMENT=	a simple log data viewing tool
LICENSE=	isc
CATEGORIES=	sysutils

MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=alog/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}alog

MAINTAINER=	openrobots@laas.fr

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	ac_cv_prog_WISH=${WISH}

DEPEND_ABI.tcl=	tcl>=8.5
DEPEND_ABI.tk=	tk>=8.5

include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/sysdep/bwidget.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
