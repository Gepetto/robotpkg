# robotpkg depend.mk for:	graphics/ros-kdl-parser
# Created:			Anthony Mallet on Wed, 12 Sep 2018
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_KDL_PARSER_DEPEND_MK:=	${ROS_KDL_PARSER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-kdl-parser
endif

ifeq (+,$(ROS_KDL_PARSER_DEPEND_MK)) # -------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-kdl-parser?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-kdl-parser?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-kdl-parser
ROS_DEPEND_USE+=		ros-kdl-parser

DEPEND_DIR.ros-kdl-parser?=	../../graphics/ros-kdl-parser

DEPEND_ABI.ros-kdl-parser.groovy?=	ros-kdl-parser>=1.9<1.10
DEPEND_ABI.ros-kdl-parser.hydro?=	ros-kdl-parser>=1.10<1.11
DEPEND_ABI.ros-kdl-parser.indigo?=	ros-kdl-parser>=1.11<1.12
DEPEND_ABI.ros-kdl-parser.jade?=	ros-kdl-parser>=1.11<1.12
DEPEND_ABI.ros-kdl-parser.kinetic?=	ros-kdl-parser>=1.12<1.13
DEPEND_ABI.ros-kdl-parser.lunar?=	ros-kdl-parser>=1.12<1.13
DEPEND_ABI.ros-kdl-parser.melodic?=	ros-kdl-parser>=1.13<1.14
DEPEND_ABI.ros-kdl-parser.noetic?=	ros-kdl-parser>=1.14<1.15

SYSTEM_SEARCH.ros-kdl-parser=\
  'include/kdl_parser/kdl_parser.hpp'					\
  'lib/libkdl_parser.so'						\
  'lib/pkgconfig/kdl_parser.pc:/Version/s/[^0-9.]//gp'			\
  'share/kdl_parser/cmake/kdl_parserConfig.cmake'			\
  'share/kdl_parser/package.xml:/<version>/s/[^0-9.]//gp'

# kdl_parser uses tinyxml in its public interface
include ../../devel/tinyxml/depend.mk
INCLUDE_DIRS.tinyxml = $(dir $(filter %/tinyxml.h,${SYSTEM_FILES.tinyxml}))

include ../../mk/sysdep/tinyxml2.mk
INCLUDE_DIRS.tinyxml2 = $(dir $(filter %/tinyxml2.h,${SYSTEM_FILES.tinyxml2}))

endif # ROS_KDL_PARSER_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
