# robotpkg depend.mk for:	sysutils/rospack
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROSPACK_DEPEND_MK:=	${ROSPACK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rospack
endif

ifeq (+,$(ROSPACK_DEPEND_MK)) # --------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.rospack?=	${PREFER.ros-base}
SYSTEM_PREFIX.rospack?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		rospack

DEPEND_METHOD.rospack?=	build
DEPEND_ABI.rospack?=	rospack>=0.4
DEPEND_DIR.rospack?=	../../sysutils/rospack

SYSTEM_SEARCH.rospack=\
	bin/rospack						\
	'share/rospack/cmake/rospack-config.cmake'		\
	'lib/pkgconfig/rospack.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

# system packages don't have any RPATH
LD_LIBRARY_DIRS.rospack=$(if $(filter robotpkg,${PREFER.rospack}),,lib)

endif # ROSPACK_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
