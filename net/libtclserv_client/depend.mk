# robotpkg depend.mk for:	net/libtclserv_client
# Created:			Arnaud Degroote on Sun, 22 Aug 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBTCLSERV_CLIENT_DEPEND_MK:=	${LIBTCLSERV_CLIENT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libtclserv_client
endif

ifeq (+,$(LIBTCLSERV_CLIENT_DEPEND_MK)) # -------------------------------------------

PREFER.libtclserv_client?=	robotpkg

DEPEND_USE+=		libtclserv_client

DEPEND_ABI.libtclserv_client?=	libtclserv_client>=0.1
DEPEND_DIR.libtclserv_client?=	../../net/libtclserv_client

SYSTEM_SEARCH.libtclserv_client=\
	include/tclserv_client/tclserv_client.h \
	lib/pkgconfig/libtclserv_client.pc	\
	lib/libtclserv_client.la

endif # LIBTCLSERV_CLIENT_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
