# robotpkg depend.mk for:	path/py39-hpp-bezier-com-traj
# Created:			Guilhem Saurel on Tue, 13 Apr 2021
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_HPP_BEZIER_COM_TRAJ_DEPEND_MK:=	${PY_HPP_BEZIER_COM_TRAJ_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-hpp-bezier-com-traj
endif

ifeq (+,$(PY_HPP_BEZIER_COM_TRAJ_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-bezier-com-traj?=		robotpkg

DEPEND_USE+=				py-hpp-bezier-com-traj

DEPEND_ABI.py-hpp-bezier-com-traj?=	${PKGTAG.python-}hpp-bezier-com-traj>=4.9.0
DEPEND_DIR.py-hpp-bezier-com-traj?=	../../path/py-hpp-bezier-com-traj

SYSTEM_SEARCH.py-hpp-bezier-com-traj=										\
	'include/hpp/bezier-com-traj/config.hh:/HPP_BEZIER_COM_TRAJ_VERSION /s/[^0-9.]//gp'			\
	'lib/cmake/hpp-bezier-com-traj/hpp-bezier-com-trajConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/libhpp-bezier-com-traj.so'										\
	'lib/pkgconfig/hpp-bezier-com-traj.pc:/Version/s/[^0-9.]//gp'						\
	'share/hpp-bezier-com-traj/package.xml:/<version>/s/[^0-9.]//gp'

endif # PY_HPP_BEZIER_COM_TRAJ_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
