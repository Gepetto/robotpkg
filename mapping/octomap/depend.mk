# robotpkg depend.mk for:	mapping/octomap
# Created:			Arnaud Degroote on Wed, 22 May 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OCTOMAP_DEPEND_MK:=	${OCTOMAP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		octomap
endif

ifeq (+,$(OCTOMAP_DEPEND_MK)) # --------------------------------------------

PREFER.octomap?=	robotpkg

DEPEND_USE+=		octomap

DEPEND_ABI.octomap?=	octomap>=1.6.0
DEPEND_DIR.octomap?=	../../mapping/octomap

SYSTEM_SEARCH.octomap= \
	include/octomap/octomap.h				\
	lib/liboctomap.so					\
	'lib/pkgconfig/octomap.pc:/Version/s/[^0-9.]//gp'

endif # OCTOMAP_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
