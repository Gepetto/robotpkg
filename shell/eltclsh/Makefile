# robotpkg Makefile for:	shell/eltclsh
# Created:			Anthony Mallet on Tue, 13 Mar 2007
#

DISTNAME=		eltclsh-1.13
CATEGORIES=		shell
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=eltclsh/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}eltclsh

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/wiki/eltclsh
COMMENT=		Interactive shell for the TCL programming language.
LICENSE=		2-clause-bsd

NOT_FOR_PLATFORM=	# empty

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=	--with-tk=$(dir ${TK_CONFIG_SH})

INCLUDE_DIRS.libedit+=	include
LIBRARY_DIRS.libedit+=	lib

include ../../devel/libedit/depend.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/robotpkg.mk
