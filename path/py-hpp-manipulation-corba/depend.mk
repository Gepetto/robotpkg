# robotpkg depend.mk for:	path/py-hpp-manipulation-corba
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_HPP_MANIPULATION_CORBA_DEPEND_MK:=	${PY_HPP_MANIPULATION_CORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-hpp-manipulation-corba
endif

ifeq (+,$(PY_HPP_MANIPULATION_CORBA_DEPEND_MK)) # ---------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-manipulation-corba?=	robotpkg

DEPEND_USE+=				py-hpp-manipulation-corba

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-hpp-manipulation-corba?=	${PKGTAG.python-}hpp-manipulation-corba>=${HPP_MIN_VERSION}
DEPEND_DIR.py-hpp-manipulation-corba?=	../../path/py-hpp-manipulation-corba

SYSTEM_SEARCH.py-hpp-manipulation-corba=										\
	'include/hpp/corbaserver/manipulation/config.hh:/HPP_MANIPULATION_VERSION /s/[^0-9.]//gp'			\
	'lib/cmake/hpp-manipulation-corba/hpp-manipulation-corbaConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/libhpp-manipulation-corba.so'										\
	'lib/pkgconfig/hpp-manipulation-corba.pc:/Version/s/[^0-9.]//gp'						\
	'share/hpp-manipulation-corba/package.xml:/<version>/s/[^0-9.]//gp'

endif # PY_HPP_MANIPULATION_CORBA_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
