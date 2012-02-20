# robotpkg sysdep/wxwidgets.mk
# Created:			Anthony Mallet on Mon Feb 20 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
WXWIDGETS_DEPEND_MK:=	${WXWIDGETS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		wxwidgets
endif

ifeq (+,$(WXWIDGETS_DEPEND_MK)) # ------------------------------------------

PREFER.wxwidgets?=	system

DEPEND_USE+=		wxwidgets
DEPEND_ABI.wxwidgets?=	wxpython>=2.8

SYSTEM_SEARCH.wxwidgets=					\
	'bin/wx-config::% --version'				\
	'include/wx-[0-9].[0-9]/wx/wx.h'			\
	'lib/libwx_gtk2{u,}_core-[0-9].[0-9].{so,a}'

SYSTEM_PKG.Debian.wxwidgets=	libwxgtk2.8-dev
SYSTEM_PKG.Fedora.wxwidgets=	wxGTK-devel
SYSTEM_PKG.NetBSD.wxwidgets=	x11/wxGTK28
SYSTEM_PKG.Ubuntu.wxwidgets=	libwxgtk2.8-dev

export WX_CONFIG=	$(word 1,${SYSTEM_FILES.wxwidgets})

endif # WXWIDGETS_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
