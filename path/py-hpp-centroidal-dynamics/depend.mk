# robotpkg depend.mk for:	path/py39-hpp-centroidal-dynamics
# Created:			Guilhem Saurel on Tue, 13 Apr 2021
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_HPP_CENTROIDAL_DYNAMICS_DEPEND_MK:=	${PY_HPP_CENTROIDAL_DYNAMICS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-hpp-centroidal-dynamics
endif

ifeq (+,$(PY_HPP_CENTROIDAL_DYNAMICS_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-centroidal-dynamics?=	robotpkg

DEPEND_USE+=				py-hpp-centroidal-dynamics

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-hpp-centroidal-dynamics?=	${PKGTAG.python-}hpp-centroidal-dynamics>=${HPP_MIN_VERSION}
DEPEND_DIR.py-hpp-centroidal-dynamics?=	../../path/py-hpp-centroidal-dynamics

SYSTEM_SEARCH.py-hpp-centroidal-dynamics=										\
	'include/hpp/centroidal-dynamics/config.hh'									\
	'lib/cmake/hpp-centroidal-dynamics/hpp-centroidal-dynamicsConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/libhpp-centroidal-dynamics.so'										\
	'lib/pkgconfig/hpp-centroidal-dynamics.pc:/Version/s/[^0-9.]//gp'						\
	'share/hpp-centroidal-dynamics/package.xml:/<version>/s/[^0-9.]//gp'

endif # PY_HPP_CENTROIDAL_DYNAMICS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
