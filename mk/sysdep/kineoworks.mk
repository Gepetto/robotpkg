# robotpkg sysdep/kineoworks.mk
# Created:			Florent on Wed Aug 28, 2013
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
KINEOWORKS_DEPEND_MK:=		${KINEOWORKS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			kineoworks
endif

ifeq (+,$(KINEOWORKS_DEPEND_MK)) # -----------------------------------------

PREFER.kineoworks?=		system

DEPEND_USE+=			kineoworks

DEPEND_ABI.kineoworks?=		kineoworks>=2.07<3

SYSTEM_SEARCH.kineoworks=\
  'include/kitelab2.07/KineoWorks2/kwsDevice.h'			\
  'include/kitelab2.07/KineoModel/kppDeviceComponent.h'		\
  'lib/kitelab2.07/libKineoWorks2Dll.so'			\
  'lib/kitelab2.07/libKineoModel.so'				\
  'lib/pkgconfig/Kite.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/KineoController.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.kineoworks=	kitelab2.07

endif # KINEOWORKS_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
