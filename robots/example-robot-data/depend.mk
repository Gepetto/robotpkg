# robotpkg depend.mk for:	robots/example-robot-data
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
EXAMPLE_ROBOT_DATA_DEPEND_MK:=	${EXAMPLE_ROBOT_DATA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			example-robot-data
endif

ifeq (+,$(EXAMPLE_ROBOT_DATA_DEPEND_MK)) # ---------------------------------

PREFER.example-robot-data?=	robotpkg

SYSTEM_SEARCH.example-robot-data=\
  'include/example-robot-data/config.hh:/EXAMPLE_ROBOT_DATA_VERSION /s/[^0-9.]//gp'\
  'lib/cmake/example-robot-data/example-robot-dataConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'\
  'lib/pkgconfig/example-robot-data.pc:/Version/s/[^0-9.]//gp'		\
  'share/example-robot-data/package.xml:/<version>/s/[^0-9.]//gp'

DEPEND_USE+=			example-robot-data

DEPEND_ABI.example-robot-data?=	example-robot-data>=3.6.0
DEPEND_DIR.example-robot-data?=	../../robots/example-robot-data

endif # EXAMPLE_ROBOT_DATA_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
