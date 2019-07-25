# robotpkg depend.mk for:	middleware/mavlink1
# Created:			Arnaud Degroote on Mon, 16 Dec 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MAVLINK_DEPEND_MK:=	${MAVLINK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mavlink1
endif

ifeq (+,$(MAVLINK_DEPEND_MK)) # --------------------------------------------

PREFER.mavlink?=	robotpkg

DEPEND_USE+=		mavlink1

DEPEND_ABI.mavlink?=	mavlink1>=1.0.9
DEPEND_DIR.mavlink?=	../../middleware/mavlink

SYSTEM_SEARCH.mavlink=\
  'include/mavlink/config.h'	\
  'lib/pkgconfig/mavlink.pc:/Version/s/[^0-9.]//gp'

endif # MAVLINK_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
