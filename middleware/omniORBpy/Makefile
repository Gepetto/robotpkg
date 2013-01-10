# robotpkg Makefile for:	middleware/omniORBpy
# Created:			Anthony Mallet on Tue, 6 Mar 2007
#

PKGREVISION=		2
DISTNAME=		omniORBpy-3.1
CATEGORIES=		middleware
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=omniorb/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://omniorb.sourceforge.net/
COMMENT=		Robust high-performance CORBA ORB for Python
LICENSE=		gnu-lgpl-v2.1


MAKE_FILE=		GNUmakefile
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-omniorb=${PREFIX.omniORB}

include ../../middleware/omniORB/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

_compiledirs=\
	omniORB			\
	CosNaming		\
	CosNaming__POA
_pycompiledirs=\
	$(addprefix ${PREFIX}/${PYTHON_SITELIB}/,${_compiledirs})

_compilefiles=\
	CORBA.py		\
	CosNaming_idl.py	\
	PortableServer.py	\
	PortableServer__POA.py	\
	omniidl_be/python.py
_pycompilefiles=\
	$(addprefix ${PREFIX}/${PYTHON_SITELIB}/,${_compilefiles})


post-install: python-compile-all(${_pycompiledirs})
post-install: python-compile-file(${_pycompilefiles})
