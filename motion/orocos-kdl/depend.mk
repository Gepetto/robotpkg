# robotpkg depend.mk for:	motion/orocos-kdl
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OROCOS_KDL_DEPEND_MK:=		${OROCOS_KDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			orocos-kdl
endif

ifeq (+,$(OROCOS_KDL_DEPEND_MK)) # -----------------------------------------

PREFER.orocos-kdl?=		robotpkg

DEPEND_USE+=			orocos-kdl

DEPEND_ABI.orocos-kdl?=		orocos-kdl>=1.1
DEPEND_DIR.orocos-kdl?=		../../motion/orocos-kdl

SYSTEM_SEARCH.orocos-kdl=\
  'include/kdl/config.h'					\
  'lib/liborocos-kdl.so'					\
  'share/orocos_kdl/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/orocos_kdl.pc:/Version/s/[^0-9.]//gp'

endif # OROCOS_KDL_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
