# robotpkg depend.mk for:	devel/log4cxx
# Created:			Anthony Mallet on Mon, 17 Jan 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LOG4CXX_DEPEND_MK:=	${LOG4CXX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		log4cxx
endif

ifeq (+,$(LOG4CXX_DEPEND_MK)) # --------------------------------------------

PREFER.log4cxx?=	system

DEPEND_USE+=		log4cxx

DEPEND_ABI.log4cxx?=	log4cxx>=0.10
DEPEND_DIR.log4cxx?=	../../devel/log4cxx

SYSTEM_SEARCH.log4cxx=\
	include/log4cxx/log4cxx.h	\
	'lib/pkgconfig/liblog4cxx.pc:/^Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.log4cxx=	liblog4cxx10-dev
SYSTEM_PKG.Fedora.log4cxx=	log4cxx-devel
SYSTEM_PKG.Ubuntu.log4cxx=	liblog4cxx10-dev
SYSTEM_PKG.NetBSD.log4cxx=	devel/log4cxx

endif # LOG4CXX_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
