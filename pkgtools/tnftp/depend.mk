# robotpkg depend.mk for:	pkgtools/tnftp
# Created:			Anthony Mallet on Sun, 20 Apr 2008
#

# Authored by Anthony Mallet on Sat Apr 19 2008

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TNFTP_DEPEND_MK:=	${TNFTP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tnftp
endif

ifeq (+,$(TNFTP_DEPEND_MK))
PREFER.tnftp?=		robotpkg

SYSTEM_SEARCH.tnftp=	'{,s}bin/{tn,}ftp'

DEPEND_USE+=		tnftp

DEPEND_ABI.tnftp?=	tnftp>=20091122
DEPEND_DIR.tnftp?=	../../pkgtools/tnftp
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
