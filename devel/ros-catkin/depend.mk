# robotpkg depend.mk for:	sysutils/py-rospkg
# Created:			Anthony Mallet on Sun, 15 Jul 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_CATKIN_DEPEND_MK:=	${ROS_CATKIN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-catkin
endif

ifeq (+,$(ROS_CATKIN_DEPEND_MK)) # -----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-catkin?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-catkin?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-catkin

DEPEND_ABI.ros-catkin?=		ros-catkin>=0.5
DEPEND_DIR.ros-catkin?=		../../devel/ros-catkin

SYSTEM_SEARCH.ros-catkin=\
	'bin/catkin_init_workspace'				\
	'lib/pkgconfig/catkin.pc:/Version/s/[^0-9.]//gp'	\
	'share/catkin/cmake/catkinConfig.cmake'			\
	'${PYTHON_SYSLIBSEARCH}/catkin/__init__.py'

CMAKE_PREFIX_PATH+=	${PREFIX.ros-catkin}

USE_ROS_CATKIN?=	yes
ifneq (,$(filter yes YES Yes,${USE_ROS_CATKIN}))
  include ../../pkgtools/pkg-config/depend.mk
  include ../../mk/sysdep/cmake.mk
  include ../../mk/sysdep/googletest.mk
  include ../../mk/sysdep/py-nose.mk
  include ../../mk/sysdep/python.mk

  include ../../mk/robotpkg.prefs.mk # for prependpaths

  CMAKE_ARGS+=-DNOSETESTS=${NOSETESTS}
  CMAKE_ARGS+=-DGTEST_ROOT=${PREFIX.googletest}
  CMAKE_ARGS+=-DCATKIN_BUILD_BINARY_PACKAGE=1
  CMAKE_ARGS+=-DCMAKE_PREFIX_PATH=$(call prependpaths,${CMAKE_PREFIX_PATH})

  ifneq (,$(filter yes YES Yes,${ROS_METAPKG}))
    CONFIGURE_DIRS?=	${WRKSRC}/build
    CMAKE_ARG_PATH?=	..

    pre-configure: catkin-init-workspace
  endif

  .PHONY: catkin-init-workspace
  catkin-init-workspace:
	${RUN}							\
	${MKDIR} ${CONFIGURE_DIRS};				\
	cd ${CONFIGURE_DIRS} && cd ${CMAKE_ARG_PATH} &&		\
	  ${PREFIX.ros-catkin}/bin/catkin_init_workspace

endif

endif # ROS_CATKIN_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
