# robotpkg depend.mk for:	devel/visit-struct
# Created:			Guilhem Saurel on Mon, 10 Oct 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
VISIT_STRUCT_DEPEND_MK:=	${VISIT_STRUCT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			visit-struct
endif

ifeq (+,$(VISIT_STRUCT_DEPEND_MK)) # ------------------------------------------

PREFER.visit-struct?=		robotpkg

SYSTEM_SEARCH.visit-struct=		\
  'include/visit_struct/visit_struct.hpp:${_visit_struct_sed}'

# extracting version from the .hpp file
_visit_struct_sed=\
  /^\#define VISIT_STRUCT_VERSION_\(MAJOR\|MINOR\|REVISION\)[ \t]*/{s///;H;};
_visit_struct_sed+=\
  $${x;s/\n/./g;s/^.//;p;}

DEPEND_USE+=			visit-struct

DEPEND_ABI.visit-struct?=	visit-struct>=1
DEPEND_DIR.visit-struct?=	../../devel/visit-struct

endif # VISIT_STRUCT_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
