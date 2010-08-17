# robotpkg depend.mk for:	devel/gbx-share
# Created:			Anthony Mallet on Wed, 17 Mar 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GBX_SHARE_DEPEND_MK:=	${GBX_SHARE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gbx-share
endif

ifeq (+,$(GBX_SHARE_DEPEND_MK)) # ------------------------------------------

PREFER.gearbox?=	robotpkg
PREFER.gbx-share?=	${PREFER.gearbox}

SYSTEM_SEARCH.gbx-share=\
  'lib/gearbox/gearbox-config-version.cmake:/PACKAGE_VERSION[ \t]/s/[^.0-9]//gp'

DEPEND_USE+=		gbx-share

DEPEND_ABI.gbx-share?=	gbx-share>=9.11
DEPEND_DIR.gbx-share?=	../../devel/gbx-share

DEPEND_METHOD.gbx-share?=build

endif # GBX_SHARE_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
