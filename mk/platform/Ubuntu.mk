#
# Variable definitions for the Ubuntu operating system.
#

# System library directories
_syslibdir=$(patsubst /usr/%,%,$(wildcard /usr/lib/${MACHINE_ARCH}-linux-gnu))
ifeq (${MACHINE_ARCH},x86_64)	# 64bits arch
  ifneq (,$(filter 08.04 10.04 10.10 11.04,${OS_VERSION}))
    # older ubuntu uses lib64 even on 64bits systems
    SYSLIBDIR?= ${_syslibdir} lib64
  else
    # newer ubuntu seems to have dropped lib64 on 64bits systems
    SYSLIBDIR?= ${_syslibdir} lib
  endif
else				# 32bits arch
  SYSLIBDIR?=	${_syslibdir} lib
endif

include ${ROBOTPKG_DIR}/mk/platform/Linux.mk
