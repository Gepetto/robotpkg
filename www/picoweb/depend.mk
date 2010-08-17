# robotpkg depend.mk for:	www/picoweb
# Created:			Matthieu Herrb on Mon, 12 Apr 2010
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PICOWEB_DEPEND_MK:=	${PICOWEB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		picoweb
endif

ifeq (+,$(PICOWEB_DEPEND_MK))
PREFER.picoweb?=	robotpkg
DEPEND_USE+=		picoweb
DEPEND_ABI.picoweb?=	picoweb>=1.1r1
DEPEND_DIR.picoweb?=	../../www/picoweb
SYSTEM_SEARCH.picoweb=	bin/picoweb
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
