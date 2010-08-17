# robotpkg depend.mk for:	architecture/orocos-ocl
# Created:			Arnaud Degroote on Thu, 22 Apr 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OROCOS_OCL_DEPEND_MK:=		${OROCOS_OCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		orocos-ocl
endif

ifeq (+,$(OROCOS_OCL_DEPEND_MK)) # ------------------------------------------

PREFER.orocos-ocl?=		robotpkg

DEPEND_USE+=		orocos-ocl

DEPEND_ABI.orocos-ocl?=	orocos-ocl>=1.10
DEPEND_DIR.orocos-ocl?=	../../architecture/orocos-ocl

SYSTEM_SEARCH.orocos-ocl=\
	include/ocl/OCL.hpp						\
	lib/liborocos-deployment-gnulinux.so	\
	lib/pkgconfig/orocos-ocl-gnulinux.pc

endif # OROCOS_OCL_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

