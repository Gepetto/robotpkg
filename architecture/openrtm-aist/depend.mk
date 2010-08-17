# robotpkg depend.mk for:	architecture/openrtm-aist
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENRTM_AIST_DEPEND_MK:=${OPENRTM_AIST_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openrtm-aist
endif

ifeq (+,$(OPENRTM_AIST_DEPEND_MK)) # ---------------------------------

PREFER.openrtm-aist?=	robotpkg

DEPEND_USE+=		openrtm-aist

DEPEND_ABI.openrtm-aist?=openrtm-aist>=0.4.2
DEPEND_DIR.openrtm-aist?=../../architecture/openrtm-aist

SYSTEM_SEARCH.openrtm-aist=\
	bin/rtm-config			\
	include/rtm/RTC.h		\
	lib/libRTC.la

endif # --- OPENRTM_AIST_DEPEND_MK -----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
