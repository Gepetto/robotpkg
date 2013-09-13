# robotpkg sysdep/gts.mk
# Created:			Severin Lemaignan on Wed 1 Sep 2010

# XForms is a GUI toolkit based on Xlib for X Window Systems. It features a
# rich set of objects, such as buttons, sliders, and menus etc. integrated into
# an easy and efficient object/event callback execution model that allows fast
# and easy construction of X-applications. In addition, the library is
# extensible and new objects can easily be created and added to the library.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
XFORMS_DEPEND_MK:=	${XFORMS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		xforms
endif

ifeq (+,$(XFORMS_DEPEND_MK)) # ---------------------------------------------

PREFER.xforms?=		system
DEPEND_USE+=		xforms
DEPEND_ABI.xforms?=	xforms>=1.0.90

_xforms.vers='\''						\
  /define FL_(REVISION|FIXLEVEL)/ { printf "." }		\
  /define FL_(VERSION|REVISION|FIXLEVEL)/ {			\
    gsub(/\"/,"",$$3); printf $$3				\
  }								\
'\''

SYSTEM_SEARCH.xforms=\
  'include/{,X11/}forms.h:p:${AWK} ${_xforms.vers} %'	\
  'lib/libforms.so'					\
  'lib/libformsGL.so'

SYSTEM_PKG.Debian.xforms=libforms-dev libformsgl-dev
SYSTEM_PKG.Fedora.xforms=xforms-devel
SYSTEM_PKG.NetBSD.xforms=x11/xforms

endif # XFORMS_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
