# robotpkg depend.mk for:	middleware/libpyyarp
# Created:			Arnaud Degroote on Thu, 15 Jul 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBPYYARP_DEPEND_MK:=	${LIBPYYARP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libpyyarp
endif

ifeq (+,$(LIBPYYARP_DEPEND_MK)) # ------------------------------------------

PREFER.libpyyarp?=	robotpkg

DEPEND_USE+=		libpyyarp
DEPEND_ABI.libpyyarp?=	${PYPKGPREFIX}-libpyyarp>=2.3.1
DEPEND_DIR.libpyyarp?=	../../middleware/libpyyarp
DEPEND_VARS.libpyyarp+=	ALTERNATIVE.python

SYSTEM_SEARCH.libpyyarp=\
	'${PYTHON_SYSLIBSEARCH}/yarp.py'

include ../../middleware/yarp/depend.mk
include ../../mk/sysdep/python.mk

endif # LIBPYYARP_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
