# robotpkg sysdep/libpcl.mk
# Created:			Anthony Mallet on Tue 24 Mar 2020
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBPCL_DEPEND_MK:=	${LIBPCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libpcl
endif

ifeq (+,$(LIBPCL_DEPEND_MK)) # ---------------------------------------------

PREFER.libpcl?=		system
DEPEND_USE+=		libpcl
DEPEND_ABI.libpcl?=	libpcl>=1

SYSTEM_SEARCH.libpcl=	\
  'include/pcl-*/pcl/pcl_config.h:/PCL_VERSION_PRETTY/s/[^0-9.]//gp'	\
  'lib/libpcl_common.so'						\
  'lib/pkgconfig/pcl_common-*.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libpcl=pcl-devel
SYSTEM_PKG.Debian.libpcl=libpcl-dev

endif # LIBPCL_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
