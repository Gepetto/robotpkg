# robotpkg depend.mk for:	hardware/openni-nite
# Created:			Matthieu Herrb on Tue, 11 Jan 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENNI_NITE_DEPEND_MK:=${OPENNI_NITE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openni-nite
endif

ifeq (+,$(OPENNI_NITE_DEPEND_MK))
PREFER.openni-nite?=	robotpkg

DEPEND_USE+=		openni-nite

DEPEND_ABI.openni-nite?=	openni-nite>=1.3.0.17
DEPEND_DIR.openni-nite?=	../../image/openni-nite

SYSTEM_SEARCH.openni-nite=\
	lib/libXnVHandGenerator.so \
	lib/libXnVNite.so \
	share/openni/XnVHandGenerator/Nite.ini \
	share/openni/licenses.xml
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
