# robotpkg Makefile for:	net/tclpcap
# Created:			Matthieu Herrb on Thu, 5 Aug 2010
#
DISTNAME=	tclpcap-2.0.0

CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=tclpcap/}
MAINTAINER=	openrobots@laas.fr
COMMENT=	Tcl interface to libpcap

LICENSE=	modified-bsd

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})

include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/libpcap.mk
include ../../mk/robotpkg.mk
