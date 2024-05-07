# robotpkg sysdep/py-setuptools.mk
# Created:			Anthony Mallet on Thu,  9 Sep 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYSETUPTOOLS_DEPEND_MK:=${PYSETUPTOOLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-setuptools
endif

ifeq (+,$(PYSETUPTOOLS_DEPEND_MK)) # ---------------------------------------

PREFER.py-setuptools?=		system

DEPEND_USE+=			py-setuptools
DEPEND_ABI.py-setuptools?=	${PKGTAG.python-}setuptools

SYSTEM_SEARCH.py-setuptools=\
  '${PYTHON_SYSLIBSEARCH}/setuptools/__init__.py'

SYSTEM_PKG.Linux.py-setuptools=	python-setuptools (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-setuptools=pkgsrc/devel/${PKGTAG.python-}setuptools

include ../../mk/sysdep/python.mk

# PYDISTUTILSPKG is deprectaced since python-3.10: provide compat until this is
# removed from mk/sysdep/python.mk
ifdef PYDISTUTILSPKG
  $(shell echo >&2 'Warning: PYDISTUTILSPKG is redundant with py-setuptools.')

  PYSETUPINSTALLARGS+=	--single-version-externally-managed
  PYSETUPINSTALLARGS+=	--root=/

else
  PYSETUP?=		setup.py

  PYSETUPBUILDTARGET?=	build
  PYSETUPBUILDARGS?=	#empty

  PYSETUPINSTALLTARGET?=install
  PYSETUPINSTALLARGS+=	--prefix=${PREFIX}
  PYSETUPINSTALLARGS+=	--install-lib=${PYSETUPINSTALL_LIB}
  PYSETUPINSTALLARGS+=	--install-script=${PYSETUPINSTALL_SCRIPT}
  PYSETUPINSTALLARGS+=	--install-data=${PYSETUPINSTALL_DATA}
  PYSETUPINSTALLARGS+=	--no-compile
  PYSETUPINSTALLARGS+=	--single-version-externally-managed
  PYSETUPINSTALLARGS+=	--root=/

  PYSETUPINSTALL_LIB?=		${PREFIX}/${PYTHON_SITELIB}
  PYSETUPINSTALL_SCRIPT?=	${PREFIX}/bin
  PYSETUPINSTALL_DATA?=		${PREFIX}

  DO_BUILD_TARGET?= do-build-setuptools(${BUILD_DIRS})
  .PHONY: do-build-setuptools()
  do-build-setuptools(%): .FORCE
	${RUN} cd ${WRKSRC} && cd '$%' && \
	  ${PYTHON} ${PYSETUP} ${PYSETUPBUILDTARGET} ${PYSETUPBUILDARGS}

  DO_INSTALL_TARGET?= do-install-setuptools(${INSTALL_DIRS})
  .PHONY: do-install-setuptools()
  do-install-setuptools(%): .FORCE
	${RUN} cd ${WRKSRC} && cd '$%' && \
	  ${PYTHON} ${PYSETUP} ${PYSETUPINSTALLTARGET} ${PYSETUPINSTALLARGS}

endif # PYDISTUTILSPKG

endif # PYSETUPTOOLS_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
