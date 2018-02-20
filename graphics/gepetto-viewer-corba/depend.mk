# robotpkg depend.mk for:	graphics/gepetto-viewer-corba
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GEPETTOVIEWER_DEPEND_MK:=	${GEPETTOVIEWER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gepetto-viewer-corba
endif

ifeq (+,$(GEPETTOVIEWER_DEPEND_MK)) # ---------------------------

PREFER.gepetto-viewer-corba?=	robotpkg

DEPEND_USE+=		gepetto-viewer-corba

DEPEND_ABI.gepetto-viewer-corba?=	gepetto-viewer-corba>=2.2.0
DEPEND_DIR.gepetto-viewer-corba?=	../../graphics/gepetto-viewer-corba

SYSTEM_SEARCH.gepetto-viewer-corba=			\
	include/gepetto/viewer/corba/client.hh	\
	lib/libgepetto-viewer-corba.so		\
	bin/gepetto-viewer-server		\
	'lib/pkgconfig/gepetto-viewer-corba.pc:/Version/s/[^0-9.]//gp'

endif # GEPETTOVIEWER_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
