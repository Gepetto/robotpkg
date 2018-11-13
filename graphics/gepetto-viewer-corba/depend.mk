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

# depend on appropriate Qt version when using Qt, all versions otherwise.
_gvc_qts={qt4,qt5}
_gvc_qt=$(if $(filter qt,${PKG_ALTERNATIVES}),${PKG_ALTERNATIVE.qt},${_gvc_qts})

DEPEND_ABI.gepetto-viewer-corba?=	${_gvc_qt}-gepetto-viewer-corba>=2.2.0
DEPEND_DIR.gepetto-viewer-corba?=	../../graphics/gepetto-viewer-corba

SYSTEM_SEARCH.gepetto-viewer-corba=\
  'bin/gepetto-gui'							\
  'include/gepetto/viewer/corba/client.hh'				\
  'lib/libgepetto-viewer-corba.so'					\
  $(foreach n,4 5,$(foreach _,'lib/pkgconfig/gepetto-viewer-corba.pc',	\
    '$_:/qtversion=$n/p::qt$n-gepetto-viewer-corba'))			\
  'lib/pkgconfig/gepetto-viewer-corba.pc:/Version/s/[^0-9.]//gp'

endif # GEPETTO_VIEWER_CORBA_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
