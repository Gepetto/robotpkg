# robotpkg sysdep/sqlite3-tcl.mk
# Created:			Anthony Mallet on Mon, 12 Sep 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SQLITE3_TCL_DEPEND_MK:=	${SQLITE3_TCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sqlite3-tcl
endif

ifeq (+,$(SQLITE3_TCL_DEPEND_MK)) # ----------------------------------------

PREFER.sqlite3-tcl?=	system

DEPEND_USE+=		sqlite3-tcl

DEPEND_ABI.sqlite3-tcl?=sqlite3-tcl>=3

_vregex=/ifneeded.*[0-9]/{s/.*ifneeded sqlite3[ \t]*//;s/[ \t].*$$//;p;q;}
SYSTEM_SEARCH.sqlite3-tcl=\
  'lib/{,tcl{,[0-9]*,tk}/}sqlite3/pkgIndex.tcl:${_vregex}'

SYSTEM_PKG.Fedora.sqlite3-tcl=	sqlite-tcl
SYSTEM_PKG.Ubuntu.sqlite3-tcl=	libsqlite3-tcl
SYSTEM_PKG.Debian.sqlite3-tcl=	libsqlite3-tcl
SYSTEM_PKG.NetBSD.sqlite3-tcl=	databases/sqlite3-tcl

include ../../mk/sysdep/tcl.mk

endif # SQLITE3_TCL_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
