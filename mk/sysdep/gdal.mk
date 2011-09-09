# robotpkg sysdep/gdal.mk
# Created:			Arnaud Degroote on Fri, 18 Mar 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GDAL_DEPEND_MK:=		${GDAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gdal
endif

ifeq (+,$(GDAL_DEPEND_MK)) # ------------------------------------------------

PREFER.gdal?=		system

DEPEND_USE+=		gdal
DEPEND_ABI.gdal?=		gdal>=1.6

SYSTEM_SEARCH.gdal=	\
	'bin/gdal-config:p:% --version' \
	'include/gdal/gdal_version.h' \
	'lib/libgdal{,[0-9]*}.so'

SYSTEM_PKG.Fedora.gdal=	gdal-devel
SYSTEM_PKG.Ubuntu.gdal=	libgdal1-dev
SYSTEM_PKG.NetBSD.gdal=		pkgsrc/geography/gdal-lib

endif # GDAL_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

