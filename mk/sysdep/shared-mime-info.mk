# robotpkg sysdep/shared-mime-info.mk
# Created:			Anthony Mallet on Tue Apr 19 2022
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
SHARED_MIME_INFO_DEPEND_MK:=	${SHARED_MIME_INFO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			shared-mime-info
endif

ifeq (+,$(SHARED_MIME_INFO_DEPEND_MK)) # -----------------------------------

PREFER.shared-mime-info?=	system
DEPEND_USE+=			shared-mime-info
DEPEND_ABI.shared-mime-info?=	shared-mime-info

SYSTEM_SEARCH.shared-mime-info=	\
  'share/pkgconfig/shared-mime-info.pc:/Version/s/[^.0-9]//gp'

endif # SHARED_MIME_INFO_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
