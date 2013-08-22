# robotpkg sysdep/netcdf.mk
# Created:			Arnaud Degroote on Aug 22 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
NETCDF_DEPEND_MK:=	${NETCDF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		netcdf
endif

ifeq (+,$(NETCDF_DEPEND_MK)) # ----------------------------------------------

PREFER.netcdf?=		system

DEPEND_USE+=		netcdf
DEPEND_ABI.netcdf?=	netcdf

SYSTEM_PKG.Fedora.netcdf=	netcdf-devel
SYSTEM_PKG.Debian.netcdf=	libnetcdf-dev
SYSTEM_PKG.NetBSD.netcdf=	devel/netcdf

SYSTEM_SEARCH.netcdf=\
	'include/netcdf.h' \
	'lib/libnetcdf.so' \
	'lib/pkgconfig/netcdf.pc:/Version/s/[^0-9.]//gp'

endif # NETCDF_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
