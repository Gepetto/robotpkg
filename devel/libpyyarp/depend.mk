# robotpkg depend.mk for:	devel/libpyyarp
# Created:			Arnaud Degroote on Thu, 15 Jul 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBPYYARP_DEPEND_MK:=	${LIBPYYARP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libpyyarp
endif

ifeq (+,$(LIBPYYARP_DEPEND_MK)) # -----------------------------------------------

PREFER.libpyyarp?=		robotpkg

DEPEND_USE+=		libpyyarp
DEPEND_ABI.libpyyarp?=	libpyyarp>=2.3.1
DEPEND_DIR.libpyyarp?=	../../devel/libpyyarp


SYSTEM_SEARCH.libpyyarp=\
	'lib/python[0-9.]*/{site-package,dist-packages}/yarp.py'
	

include ../../architecture/yarp/depend.mk

endif # LIBPYYARP_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
