# robotpkg depend.mk for:	devel/asio
# Created:			Anthony Mallet on Tue, 24 May 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ASIO_DEPEND_MK:=	${ASIO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		asio
endif

ifeq (+,$(ASIO_DEPEND_MK)) # -----------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Rocky,${OPSYS})
  PREFER.asio?=		robotpkg
endif
PREFER.asio?=		system
DEPEND_USE+=		asio

DEPEND_METHOD.asio?=	build
DEPEND_ABI.asio?=	asio>=0
DEPEND_DIR.asio?=	../../devel/asio

SYSTEM_SEARCH.asio=\
  'include/asio.hpp'	\
  'include/asio/version.hpp:/^\#define ASIO_VERSION.*\/\//{s///;s/[^0-9.]//gp;}'

SYSTEM_PKG.Debian.asio=	asio-dev
SYSTEM_PKG.Fedora.asio=	asio-devel

endif # ASIO_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
