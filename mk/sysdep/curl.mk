# robotpkg sysdep/curl.mk
# Created:			Anthony Mallet on Thu,  7 Feb 2013
#
DEPEND_DEPTH:=	${DEPEND_DEPTH}+
CURL_DEPEND_MK:=${CURL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	curl
endif

ifeq (+,$(CURL_DEPEND_MK)) # -----------------------------------------------

PREFER.curl?=		system
DEPEND_USE+=		curl
DEPEND_METHOD.curl?=	build
DEPEND_ABI.curl?=	curl>=7

SYSTEM_SEARCH.curl=	\
	'bin/curl:1{s/^[^0-9.]*//;s/[^0-9.].*$$//;p;}:% --version'

export CURL=	$(firstword ${SYSTEM_FILES.curl})

endif # CURL_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=	${DEPEND_DEPTH:+=}
