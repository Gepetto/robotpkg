#
# Variable definitions for the Fedora operating system.
#

# System library directories
ifeq (${MACHINE_ARCH},x86_64)	# 64bits arch
  # fedora uses lib64 even on 64bits systems, but some stuff remains in lib
  SYSLIBDIR?=	lib64 lib
endif

include ${ROBOTPKG_DIR}/mk/platform/Linux.mk
