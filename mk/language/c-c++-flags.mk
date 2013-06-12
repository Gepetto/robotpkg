# robotpkg language/c-c++-flags.mk
# Created:			Anthony Mallet on Thu, 10 Jan 2013
#
ifndef _language_c_cxx_flags_mk
_language_c_cxx_flags_mk:=defined

# INCLUDE_DIRS.<pkg> is a list of subdirectories of PREFIX.<pkg> (or absolute
# directories) that should be added to the compiler search paths.
#
CPPFLAGS+=$(addprefix -I,						\
	$(call lappend,							\
	  $(filter-out $(addprefix /usr/,${SYSINCDIR} include),		\
	  $(foreach _pkg_,${DEPEND_USE},$(realpath			\
	    $(addprefix ${PREFIX.${_pkg_}}/,${INCLUDE_DIRS.${_pkg_}})	\
	    ${INCLUDE_DIRS.${_pkg_}})))))

# LIBRARY_DIRS.<pkg> is a list of subdirectories of PREFIX.<pkg> (or absolute
# directories) that should be added to the linker search paths.
#
LDFLAGS+=$(addprefix -L,						\
	$(call lappend,							\
	  $(filter-out $(addprefix /usr/,${SYSLIBDIR} lib),		\
	  $(addprefix ${PREFIX}/,					\
	    $(patsubst ${PREFIX}/%,%,${LIBRARY_DIRS}))			\
	  $(foreach _pkg_,${DEPEND_USE},$(realpath			\
	    $(addprefix ${PREFIX.${_pkg_}}/,${LIBRARY_DIRS.${_pkg_}})	\
	    ${LIBRARY_DIRS.${_pkg_}})))))

# RPATH_DIRS.<pkg> is a list of subdirectories of PREFIX.<pkg> (or absolute
# directories) that should be added to the linker run-time search paths.
#
LDFLAGS+=$(if $(call isyes,${_USE_RPATH}),				\
  $(addprefix ${COMPILER_RPATH_FLAG},					\
	$(call lappend,							\
	  $(filter-out $(addprefix /usr/,${SYSLIBDIR} lib),		\
	  $(addprefix ${PREFIX}/,					\
	    $(patsubst ${PREFIX}/%,%,${RPATH_DIRS}))			\
	  $(foreach _pkg_,${DEPEND_USE},$(realpath			\
	    $(addprefix ${PREFIX.${_pkg_}}/,${RPATH_DIRS.${_pkg_}})	\
	    ${RPATH_DIRS.${_pkg_}}))))))

# Check user specific compile flags, with pattern option settings in the
# absence of an explicit setting.
#
override define _flags_pattern
  $1+=$$(or $${$1.$${PKG_OPTIONS_SUFFIX}},$$(strip			\
    $$(foreach _,$$(filter $1.%,$${.VARIABLES}),$$(strip		\
      $$(if $$(filter $$_,$1.$${PKG_OPTIONS_SUFFIX}),$$(value $$_))))))
endef
$(foreach _,CPPFLAGS CFLAGS CXXFLAGS LDFLAGS,$(eval $(call _flags_pattern,$_)))

# Export flags
export CPPFLAGS
export CFLAGS
export LDFLAGS
export CXXFLAGS


# define a common debug option (make sure to append to any existing script)
PKG_SUPPORTED_OPTIONS+=	debug
PKG_OPTION_DESCR.debug=	Produce debugging information for binary programs

define _lang_c_debug
  CFLAGS+=	${C_COMPILER_FLAGS_DEBUG}
  CXXFLAGS+=	${CXX_COMPILER_FLAGS_DEBUG}
endef
PKG_OPTION_SET.debug:=$(value PKG_OPTION_SET.debug)$(value _lang_c_debug)

define _lang_c_ndebug

  CFLAGS+=	${C_COMPILER_FLAGS_NDEBUG}
  CXXFLAGS+=	${CXX_COMPILER_FLAGS_NDEBUG}
endef
PKG_OPTION_UNSET.debug:=$(value PKG_OPTION_UNSET.debug)$(value _lang_c_ndebug)

endif # _language_c_cxx_flags_mk -------------------------------------------
