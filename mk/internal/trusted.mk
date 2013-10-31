#
# Copyright (c) 2013 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use  in  source  and binary  forms,  with  or  without
# modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
# THE SOFTWARE  IS PROVIDED "AS IS"  AND THE AUTHOR  DISCLAIMS ALL WARRANTIES
# WITH  REGARD   TO  THIS  SOFTWARE  INCLUDING  ALL   IMPLIED  WARRANTIES  OF
# MERCHANTABILITY AND  FITNESS.  IN NO EVENT  SHALL THE AUTHOR  BE LIABLE FOR
# ANY  SPECIAL, DIRECT,  INDIRECT, OR  CONSEQUENTIAL DAMAGES  OR  ANY DAMAGES
# WHATSOEVER  RESULTING FROM  LOSS OF  USE, DATA  OR PROFITS,  WHETHER  IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR  OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#                                           Anthony Mallet on Thu Oct 10 2013
#

# Clean unwanted variables inherited from the environment
#

# --- Resart with a clean environment --------------------------------------
#
_ENV_VARS+=	MAKE MAKECONF ROBOTPKG_BASE ROBOTPKG_DIR
_ENV_VARS+=	HOME PATH TERM TERMCAP DISPLAY XAUTHORITY SSH_AUTH_SOCK
_ENV_VARS+=	http_proxy https_proxy ftp_proxy

.PHONY: unsetenv
unsetenv:
	@${SETENV} -i							\
	  $(foreach _,${_ENV_VARS},					\
	    $(if $(filter environment,$(origin $_)),			\
	      $(call quote,$_=${$_})))					\
	  ROBOTPKG_TRUSTED_ENV=robotpkg					\
	  ${MAKE} ${MFLAGS} ${MAKEOVERRIDES} ${MAKECMDGOALS}

${MAKECMDGOALS}: unsetenv
	@:
