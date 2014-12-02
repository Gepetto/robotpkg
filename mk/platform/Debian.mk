#
# Variable definitions for the Debian operating system.
#

# Compute the Debian multiarch tuple (and cache the result). Try to guess the
# value, but fallback to dpkg-architecture if the result is ambiguous.
ifndef DEB_HOST_MULTIARCH
  _deb_host=\
    $(patsubst /usr/lib/%,%,$(wildcard /usr/lib/${MACHINE_ARCH}-linux-gnu*))
  ifeq (,$(filter 0 1,$(words ${_deb_host})))
    DEB_HOST_MULTIARCH=\
      $(shell dpkg-architecture -qDEB_HOST_MULTIARCH 2>/dev/null)
  else
    DEB_HOST_MULTIARCH=${_deb_host}
  endif
  export DEB_HOST_MULTIARCH
  _ENV_VARS+=DEB_HOST_MULTIARCH
endif

# System headers directories
SYSINCDIR?=\
  $(addprefix include/,${DEB_HOST_MULTIARCH})	\
  include

# System library directories
SYSLIBDIR?=\
  $(addprefix lib/,${DEB_HOST_MULTIARCH})	\
  lib

include ${ROBOTPKG_DIR}/mk/platform/Linux.mk
