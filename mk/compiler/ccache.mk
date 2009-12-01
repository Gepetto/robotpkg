#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                             Anthony Mallet on Sat Nov 28 2009
#

#
# This is the compiler definition for the ccache pseudo compiler
#
# The following variables may be set by a package:
#
# USE_CCACHE
#	Can be set to "no" for packages that have problems with ccache.
#
ifeq (,$(call isno,${USE_CCACHE}))

# require ccache for languages that can use it
ifneq (,$(filter c c++,${USE_LANGUAGES}))
  include ${ROBOTPKG_DIR}/mk/sysdep/ccache.mk
endif

# set the C compiler
ifneq (,$(filter c,${USE_LANGUAGES}))
  ROBOTPKG_CC+=${CCACHE}
endif

# set the C++ compiler
ifneq (,$(filter c++,${USE_LANGUAGES}))
  ROBOTPKG_CXX+=${CCACHE}
endif

endif # USE_CCACHE
