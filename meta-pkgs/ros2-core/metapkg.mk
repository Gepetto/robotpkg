# robotpkg Makefile for:	meta-pks/ros2-core
# Created:			Anthony Mallet on Fri Apr  1 2022
#
# Handle ros2 meta packages.
#

ifndef ROS2_SUBPKGS
  PKG_FAIL_REASON+="ROS2_SUBPKGS is required."
endif

# Output sub packages as tool/dir according to "tool:" keywords found in the
# sub packages list. Default is to use cmake.
define ROS2_SUBPKGS_TOOLDIRS:=
  $(eval 0:=cmake)
  $(foreach _,${ROS2_SUBPKGS},
    $(if $(filter %:,$_),$(eval 0:=${_::=}),
      $0/$_))
endef

# Bare sub packages directories.
ROS2_SUBPKGS_DIRS= $(filter-out %:,${ROS2_SUBPKGS})


# In order to resolve inter-package dependencies between sub packages, building
# is done by doing configure/make install to a private DESTDIR for each sub
# package in turn. The robotpkg configure phase is left empty.
#
CONFIGURE_DIRS=		# empty
BUILD_DIRS=		${ROS2_SUBPKGS_DIRS}

DO_CONFIGURE_TARGET=	# empty
DO_BUILD_TARGET=	do-build-ros2(${ROS2_SUBPKGS_TOOLDIRS})
DO_INSTALL_TARGET=	do-install-ros2(${ROS2_SUBPKGS_TOOLDIRS})

# make
BUILD_TARGET=		install
BUILD_MAKE_FLAGS+=	DESTDIR=${WRKDIR}/.destdir

# setuptools
PYSETUPBUILDTARGET=	install
PYSETUPBUILDARGS+=	--prefix=${PREFIX}
PYSETUPBUILDARGS+=	--no-compile
PYSETUPBUILDARGS+=	--single-version-externally-managed
PYSETUPBUILDARGS+=	--root=${WRKDIR}/.destdir

do-build-ros2(cmake/%): ros2-msg(%) do-configure-cmake(%) do-build-make(%) ;@:
do-build-ros2(python/%): ros2-msg(%) do-build-setuptools(%) ;@:

do-install-ros2(cmake/%): ros2-msg(%) do-install-make(%) ;@:
do-install-ros2(python/%): ros2-msg(%) do-install-setuptools(%) ;@:

ros2-msg(%):
	${RUN}${STEP_MSG} "Processing $%"


# Inter-package dependencies are in the staged install directory.
CMAKE_PREFIX_PATH+=	${WRKDIR}/.destdir/${PREFIX}

include \
  $(if $(filter cmake/%,${ROS2_SUBPKGS_TOOLDIRS}),	\
    ../../mk/sysdep/cmake.mk)				\
  $(if $(filter python/%,${ROS2_SUBPKGS_TOOLDIRS}),	\
    ../../mk/sysdep/py-setuptools.mk)
