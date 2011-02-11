# robotpkg sysdep/wget.mk
# Created:			Anthony Mallet on Tue, 11 Jan 2011
#

# Wget [formerly known as Geturl] is a freely available network utility
# to retrieve files from the World Wide Web using HTTP and FTP, the two
# most widely used Internet protocols.  It works non-interactively, thus
# enabling work in the background, after having logged off.

DEPEND_DEPTH:=	${DEPEND_DEPTH}+
WGET_DEPEND_MK:=	${WGET_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	wget
endif

ifeq (+,$(WGET_DEPEND_MK)) # -----------------------------------------------

PREFER.wget?=	system
DEPEND_USE+=	wget
DEPEND_ABI.wget?=wget>=1

SYSTEM_SEARCH.wget=	\
	'bin/wget:1{s/[^0-9.]//g;s/[.]$$//;p;}:% --version'

export WGET=	$(firstword ${SYSTEM_FILES.wget})

endif # WGET_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
