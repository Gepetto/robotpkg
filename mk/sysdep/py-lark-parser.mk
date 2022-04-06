# robotpkg sysdep/py-lark-parser.mk
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_LARK_PARSER_DEPEND_MK:=	${PY_LARK_PARSER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-lark-parser
endif

ifeq (+,$(PY_LARK_PARSER_DEPEND_MK)) # -------------------------------------

PREFER.py-lark-parser?=		system

DEPEND_USE+=			py-lark-parser
DEPEND_ABI.py-lark-parser?=	${PKGTAG.python-}lark-parser>=0

SYSTEM_SEARCH.py-lark-parser=\
  '${PYTHON_SYSLIBSEARCH}/lark/__init__.py:/^__version__/s/[^0-9.]//gp'	\

SYSTEM_PKG.RedHat.py-lark-parser=	python${PYTHON_MAJOR}-lark
SYSTEM_PKG.Debian.py-lark-parser=	python${PYTHON_MAJOR}-lark-parser
SYSTEM_PKG.NetBSD.py-lark-parser=	lang/${PKGTAG.python-}lark-parser

include ../../mk/sysdep/python.mk

endif # PY_LARK_PARSER_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
