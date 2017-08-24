# robotpkg depend.mk for:	middleware/openrtm-aist
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

DEPEND_ABI.openrtm-aist?=openrtm-aist>=1
DEPEND_DIR.openrtm-aist?=../../middleware/openrtm-aist

SYSTEM_SEARCH.openrtm-aist=\
  'bin/rtm-config'						\
  'include/openrtm-[0-9]*/rtm/RTC.h'				\
  'lib/pkgconfig/openrtm-aist.pc:/Version/s/[^.0-9]//gp'	\
  'lib/libRTC.la'

endif # --- OPENRTM_AIST_DEPEND_MK -----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
