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
ROS_DEPEND_USE+=		ros-catkin

DEPEND_ABI.ros-catkin?=		ros-catkin>=0.4
DEPEND_DIR.ros-catkin?=		../../devel/ros-catkin

DEPEND_ABI.ros-catkin.groovy?=	ros-catkin>=0.5<0.6
DEPEND_ABI.ros-catkin.hydro?=	ros-catkin>=0.5<0.6
DEPEND_ABI.ros-catkin.indigo?=	ros-catkin>=0.6<0.7
DEPEND_ABI.ros-catkin.jade?=	ros-catkin>=0.6<0.7
DEPEND_ABI.ros-catkin.kinetic?=	ros-catkin>=0.7<0.8
DEPEND_ABI.ros-catkin.lunar?=	ros-catkin>=0.7<0.8
DEPEND_ABI.ros-catkin.melodic?=	ros-catkin>=0.7<0.8

SYSTEM_SEARCH.ros-catkin=\
	'bin/catkin_init_workspace'				\
	'lib/pkgconfig/catkin.pc:/Version/s/[^0-9.]//gp'	\
	'share/catkin/cmake/catkinConfig.cmake'			\
	'${PYTHON_SYSLIBSEARCH}/catkin/__init__.py'

CMAKE_PREFIX_PATH.ros-catkin=	${PREFIX.ros-catkin}

USE_ROS_CATKIN?=	yes
ifneq (,$(filter yes YES Yes,${USE_ROS_CATKIN}))
  DEPEND_ABI.cmake+= cmake>=2.8.3
  include ../../pkgtools/pkg-config/depend.mk
  include ../../mk/sysdep/cmake.mk
  include ../../mk/sysdep/googletest.mk
  include ../../mk/sysdep/py-empy.mk
  include ../../mk/sysdep/py-nose.mk
  include ../../mk/sysdep/python.mk

  include ../../mk/robotpkg.prefs.mk # for prependpaths

  CMAKE_ARGS+=-DCATKIN_DEVEL_PREFIX=${WRKDIR}/stage
  CMAKE_ARGS+=-DNOSETESTS=${NOSETESTS}
  CMAKE_ARGS+=-DGTEST_ROOT=${PREFIX.googletest}
  CMAKE_ARGS+=-DCATKIN_BUILD_BINARY_PACKAGE=1
  CMAKE_ARGS+=-DSETUPTOOLS_DEB_LAYOUT=OFF

  ifneq (,$(filter yes YES Yes,${ROS_METAPKG}))
    CONFIGURE_DIRS?=	${WRKSRC}/build
    CMAKE_ARG_PATH?=	..

    pre-configure: catkin-init-workspace
  endif

  .PHONY: catkin-init-workspace
  catkin-init-workspace:
	${RUN}							\
	${MKDIR} ${CONFIGURE_DIRS};				\
	cd ${CONFIGURE_DIRS} && cd ${CMAKE_ARG_PATH};		\
	${TEST} ! -h CMakeLists.txt || ${RM} CMakeLists.txt;	\
	${PREFIX.ros-catkin}/bin/catkin_init_workspace

  # INSTALL script keeping track of ${PREFIX}/.catkin file
  include ${DEPEND_DIR.ros-catkin}/marker.mk
endif

endif # ROS_CATKIN_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
