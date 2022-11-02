# robotpkg sysdep/oxygen-icons.mk
# Created:				Guilhem Saurel on Wed Nov 02 2022
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OXYGEN_ICONS_DEPEND_MK:=	${OXYGEN_ICONS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			oxygen-icons
endif

ifeq (+,$(OXYGEN_ICONS_DEPEND_MK)) # ---------------------------------------

PREFER.oxygen-icons?=		system
DEPEND_USE+=			oxygen-icons
DEPEND_ABI.oxygen-icons?=	oxygen-icons

SYSTEM_PKG.Arch.oxygen-icons=	oxygen-icons
SYSTEM_PKG.Debian.oxygen-icons=	oxygen-icon-theme

SYSTEM_SEARCH.oxygen-icons=	\
  'share/icons/oxygen/index.theme'

endif # OXYGEN_ICONS_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
