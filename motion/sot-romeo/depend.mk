# robotpkg depend.mk for:	robots/sot-romeo
# Created:			Aurelie Clodic on Fri, 20 Jun 2014
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SOT_ROMEO_DEPEND_MK:=	${SOT_ROMEO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sot-romeo
endif

ifeq (+,$(SOT_ROMEO_DEPEND_MK)) # ------------------------------------------

PREFER.sot-romeo?=	robotpkg

DEPEND_USE+=		sot-romeo

DEPEND_ABI.sot-romeo?=	sot-romeo>=1.0.0
DEPEND_DIR.sot-romeo?=	../../motion/sot-romeo

SYSTEM_SEARCH.sot-romeo=\
 'include/sot-romeo/config.h'				\
 'lib/libsot-romeo-controller.so'			\
 '${PYTHON_SITELIB}/dynamic_graph/sot/romeo/robot.py'	\
 'lib/pkgconfig/sot-romeo.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # SOT_ROMEO_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
