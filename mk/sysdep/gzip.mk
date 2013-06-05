# robotpkg sysdep/gzip.mk
# Created:			Anthony Mallet on Wed,  5 Jun 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GZIP_DEPEND_MK:=	${GZIP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gzip
endif

ifeq (+,$(GZIP_DEPEND_MK)) # -----------------------------------------------

PREFER.gzip?=		system
DEPEND_USE+=		gzip
DEPEND_ABI.gzip?=	gzip

SYSTEM_SEARCH.gzip=\
	'bin/gzip:1s/[^0-9.]//gp:% --version'	\
	'bin/zcat:1s/[^0-9.]//gp:% --version'

# Don't call a variable "GZIP" because the gzip program uses this
# environment variable to define default options.
#
export GZIP_CMD=	$(word 1,${SYSTEM_FILES.gzip})
export ZCAT=		$(word 2,${SYSTEM_FILES.gzip})

endif # GZIP_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
