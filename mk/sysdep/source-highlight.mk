# robotpkg sysdep/source-highlight.mk
# Created:			Anthony Mallet on Tue, 11 Jun 2013
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
SOURCE_HIGHLIGHT_DEPEND_MK:=	${SOURCE_HIGHLIGHT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			source-highlight
endif

ifeq (+,$(SOURCE_HIGHLIGHT_DEPEND_MK)) # -----------------------------------

PREFER.source-highlight?=	system

DEPEND_USE+=			source-highlight
DEPEND_ABI.source-highlight?=	source-highlight>=3
DEPEND_METHOD.source-highlight?=build

SYSTEM_SEARCH.source-highlight=\
  'bin/source-highlight:1{s/^[^0-9.]*//;s/[^0-9.].*$$//;p}:% --version'

SYSTEM_PKG.Linux.source-highlight=	source-highlight
SYSTEM_PKG.NetBSD.source-highlight=	textproc/source-highlight

endif # SOURCE_HIGHLIGHT_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
