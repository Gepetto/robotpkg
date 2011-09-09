#
# Variable definitions for the Ubuntu operating system.
#

# System library directories
_syslibdir=$(patsubst /usr/%,%,$(wildcard /usr/lib/${MACHINE_ARCH}-linux-gnu))
ifeq (${MACHINE_ARCH},x86_64)	# 64bits arch
  SYSLIBDIR?=	${_syslibdir} lib64
else				# 32bits arch
  SYSLIBDIR?=	${_syslibdir} lib
endif

include ${ROBOTPKG_DIR}/mk/platform/Linux.mk
