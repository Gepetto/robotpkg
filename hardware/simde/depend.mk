# robotpkg depend.mk for:	hardware/simde
# Created:			Guilhem Saurel on Mon, 10 Oct 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
SIMDE_DEPEND_MK:=		${SIMDE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			simde
endif

ifeq (+,$(SIMDE_DEPEND_MK)) # ------------------------------------------

PREFER.simde?=			robotpkg

SYSTEM_SEARCH.simde=		\
  'include/simde/simde-common.h:${_simde_sed}'

# extracting version from the .hpp file
_simde_sed=\
  /^\#define SIMDE_VERSION_\(MAJOR\|MINOR\|REVISION\)[ \t]*/{s///;H;};
_simde_sed+=\
  $${x;s/\n/./g;s/^.//;p;}

DEPEND_USE+=			simde

DEPEND_ABI.simde?=		simde>=0.7.2
DEPEND_DIR.simde?=		../../hardware/simde

endif # SIMDE_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
