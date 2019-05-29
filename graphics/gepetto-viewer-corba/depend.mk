# robotpkg depend.mk for:	graphics/gepetto-viewer-corba
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
GEPETTO_VIEWER_CORBA_DEPEND_MK:=	${GEPETTO_VIEWER_CORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				gepetto-viewer-corba
endif

ifeq (+,$(GEPETTO_VIEWER_CORBA_DEPEND_MK)) # -------------------------------

PREFER.gepetto-viewer-corba?=		robotpkg

DEPEND_USE+=				gepetto-viewer-corba

DEPEND_ABI.gepetto-viewer-corba?=	${PKGTAG.python}-${PKGTAG.qt}-gepetto-viewer-corba>=5.3.0
DEPEND_DIR.gepetto-viewer-corba?=	../../graphics/gepetto-viewer-corba

SYSTEM_SEARCH.gepetto-viewer-corba=\
  'include/gepetto/viewer/corba/server.hh'				\
  'lib/libgepetto-viewer-corba.so'					\
  'lib/pkgconfig/gepetto-viewer-corba.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qt.mk

endif # GEPETTO_VIEWER_CORBA_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
