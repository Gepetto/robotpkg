#
# Copyright (c) 2009-2010 LAAS/CNRS
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
#                                      Anthony Mallet on Tue Mar 17 2009
#

$(call require, ${ROBOTPKG_DIR}/mk/extract/extract-vars.mk)
ifdef _EXTRACT_IS_CHECKOUT
  UPDATE_CLEAN?=	no	# don't clean after update
else
  UPDATE_CLEAN?=	yes	# clean up after update
endif

# UPDATE_TARGET is the target that is invoked when updating packages during
# a "make update".  This variable is user-settable within etc/robotpkg.conf.
#
ifndef UPDATE_TARGET
  ifneq (,$(filter update,${DEPENDS_TARGET}))
    ifneq (,$(filter package,${MAKECMDGOALS}))
      UPDATE_TARGET=	package
    else
      UPDATE_TARGET=	reinstall
    endif
  else
    UPDATE_TARGET=	${DEPENDS_TARGET}
  endif
endif

# Handle confirm target given on command line
#
ifneq (,$(filter confirm,${MAKECMDGOALS}))
  UPDATE_TARGET+=	confirm
endif

# state variables
_UPDATE_DIRS=	${WRKDIR}/.DDIR
_UPDATE_LIST=	${WRKDIR}/.DLIST

include ${ROBOTPKG_DIR}/mk/update/update.mk
