#
# Variable definitions for the Debian operating system.
#

# System library directories
SYSLIBDIR?=\
  $(patsubst /usr/%,%,$(wildcard /usr/lib/${MACHINE_ARCH}-linux-gnu))	\
  lib

include ${ROBOTPKG_DIR}/mk/platform/Linux.mk
