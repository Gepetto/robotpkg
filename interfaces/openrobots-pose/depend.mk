# robotpkg depend.mk for:	architecture/openrobots-pose
# Created:			Mokhtar Gharbi on Tue, 18 Jan 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENROBOTSPOSE_DEPEND_MK:=	${OPENROBOTSPOSE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openrobots-pose
endif

ifeq (+,$(OPENROBOTSPOSE_DEPEND_MK))
PREFER.openrobots-pose?=	robotpkg

DEPEND_USE+=		openrobots-pose

DEPEND_ABI.openrobots-pose?=	openrobots-pose>=1.2
DEPEND_DIR.openrobots-pose?=	../../interfaces/openrobots-pose

SYSTEM_SEARCH.openrobots-pose=\
	include/openrobots/pose.h		\
	lib/pkgconfig/openrobots-pose.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
