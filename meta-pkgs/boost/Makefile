# robotpkg Makefile for:	meta-pkgs/boost
# Created:			Anthony Mallet on Tue, 5 Dec 2006
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile.common,v 1.9 2006/11/10 17:41:13 tv Exp $

BOOST_PACKAGE=	meta-pkg
BOOST_COMMENT=	(meta package)

PREFER.boost?=	robotpkg
include Makefile.common

CATEGORIES=	meta-pkgs
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.boost.org/
COMMENT=	Free, peer-reviewed portable C++ source libraries

META_PACKAGE=	yes

DEPEND_ABI.boost-jam?=		boost-jam>=${BOOST_VERSION}
DEPEND_ABI.boost-docs?=		boost-docs>=${BOOST_VERSION}
DEPEND_ABI.boost-headers?=	boost-headers>=${BOOST_VERSION}
DEPEND_ABI.boost-libs?=		boost-libs>=${BOOST_VERSION}

include ../../devel/boost-jam/depend.mk
include ../../devel/boost-docs/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/robotpkg.mk
