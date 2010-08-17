# robotpkg depend.mk for:	robots/neobotix-libs
# Created:			Matthieu Herrb on Fri, 13 Mar 2009
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
NEOBOTIX_LIBS_DEPEND_MK:=	${NEOBOTIX_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			neobotix-libs
endif

ifeq (+,$(NEOBOTIX_LIBS_DEPEND_MK))
PREFER.neobotix-libs?=		robotpkg

DEPEND_USE+=			neobotix-libs

DEPEND_ABI.neobotix-libs?=	neobotix-libs>=1.1
DEPEND_DIR.neobotix-libs?=	../../robots/neobotix-libs

SYSTEM_SEARCH.neobotix-libs= \
				include/neobotix/neo.h \
				lib/libneobotix.la \
				lib/pkgconfig/neobotix.pc
endif

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
