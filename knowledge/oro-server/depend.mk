# robotpkg depend.mk for:	knowledge/oro-server
# Created:			Séverin Lemaignan on Mon, 6 Jul 2009
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OROSERVER_DEPEND_MK:=	${OROSERVER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		oro-server
endif

ifeq (+,$(OROSERVER_DEPEND_MK)) # -----------------------------------------------

PREFER.oro-server?=		robotpkg

DEPEND_USE+=		oro-server
DEPEND_ABI.oro-server?=	oro-server>=0.7.12
DEPEND_DIR.oro-server?=	../../knowledge/oro-server

SYSTEM_SEARCH.oro-server=\
	bin/oro-server

endif # OROSERVER_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
