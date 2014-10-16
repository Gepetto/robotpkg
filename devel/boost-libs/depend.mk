# robotpkg depend.mk for:	devel/boost-libs
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

# Before including this file, the following variables can be defined:
#
# USE_BOOST_LIBS
#	This is a list of boost libraries that are to be searched for. If
#	unset, the following default set is used:
#		filesystem iostreams math thread
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST_LIBS_DEPEND_MK:=	${BOOST_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		$(addprefix boost-lib-,${USE_BOOST_LIBS})
endif

ifeq (+,$(BOOST_LIBS_DEPEND_MK)) # -----------------------------------

DEPEND_USE+=		$(addprefix boost-lib-,${USE_BOOST_LIBS})

PREFER.boost?=		system
PREFER.boost-libs?=	${PREFER.boost}

DEPEND_ABI.boost-libs?=	boost-libs>=1.34.1
DEPEND_DIR.boost-libs?=	../../devel/boost-libs

override define _use_boost_libs
  PREFER.boost-lib-$1?=		$${PREFER.boost-libs}
  DEPEND_ABI.boost-lib-$1?=	$${DEPEND_ABI.boost-libs}
  DEPEND_DIR.boost-lib-$1?=	../../devel/boost-libs

  _boost_libs_files_$1?=	$1
  SYSTEM_SEARCH.boost-lib-$1?=$$(foreach 2,$${_boost_libs_files_$1},	\
    'lib/libboost_$$2{-mt,}{-[0-9]*,}.so{.*[0-9],}:s/.*[.]so[.]//p:$${ECHO} %' \
    'lib/libboost_$$2{-mt,}{-[0-9]*,}.so')

  SYSTEM_DESCR.boost-lib-$1?=\
    $$(subst boost-libs,boostlib-$1,$${DEPEND_ABI.boost-lib-$1})

  SYSTEM_PKG.Fedora.boost-lib-$1?=	boost-libs ($1)
  SYSTEM_PKG.Debian.boost-lib-$1?=	libboost-$1-dev
  SYSTEM_PKG.Ubuntu.boost-lib-$1?=	libboost-$1-dev
  SYSTEM_PKG.NetBSD.boost-lib-$1?=	devel/boost-libs

  SYSTEM_FILES.boost-libs+= $${SYSTEM_FILES.boost-lib-$1}

  # propagate compile flags from meta boost-libs
  INCLUDE_DIRS.boost-libs-$1?=	${INCLUDE_DIRS.boost-libs}
  LIBRARY_DIRS.boost-libs-$1?=	${LIBRARY_DIRS.boost-libs}
  RPATH_DIRS.boost-libs-$1?=	${RPATH_DIRS.boost-libs}
endef

# specific library files and packages (overrides default)
_boost_libs_files_math=			math_c99 math_tr1

SYSTEM_PKG.NetBSD.boost-lib-python?=	devel/boost-python

# default boost components
USE_BOOST_LIBS?=\
	filesystem	\
	iostreams	\
	math		\
	thread

# aggregate prefix - usually reduces to the single prefix of boost-libs
PREFIX.boost-libs=\
  $(sort $(foreach _,${USE_BOOST_LIBS},${PREFIX.boost-lib-$_}))

# mt and/or version suffix. Hairy inside: find anything after `-' and before
# `.', sort this out and make sure it's consistent.
BOOST_LIB_SUFFIX=\
  $(sort $(foreach _,${USE_BOOST_LIBS},					\
    $(foreach __,${_boost_libs_files_$_},				\
      $(patsubst libboost_${__}%,%,					\
      $(word 1,$(subst ., ,$(notdir ${SYSTEM_FILES.boost-lib-${__}})))))))
PKG_FAIL_REASON+=\
  $(if $(filter-out 0 1,$(words ${BOOST_LIB_SUFFIX})),			\
    "Boost libraries have inconsistent suffixes: ${BOOST_LIB_SUFFIX}"	\
    ${SYSTEM_FILES.boost-libs})

# For cmake/FindBoost users
CMAKE_ARGS+=	'-DBOOST_LIBRARYDIR=${PREFIX.boost-libs:=/lib}'


endif # BOOST_LIBS_DEPEND_MK -----------------------------------------

# apply USE_BOOST_LIBS selection
$(foreach _,${USE_BOOST_LIBS},$(eval $(call _use_boost_libs,$_)))

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
