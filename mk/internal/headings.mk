#
# Copyright (c) 2010 LAAS/CNRS
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
#                                           Anthony Mallet on Mon Aug 16 2010
#

# --- headings -------------------------------------------------------------
#
# This target is used to generate uniform headings for a package Makefile and
# other files.
#
GIT?=			git

ifeq (2,${_ROBOTPKG_DEPTH})
  _HEADINGS_TARGETS+=	do-headings-pkg-Makefile
  ifeq (yes,$(call exists,depend.mk))
    _HEADINGS_TARGETS+=	do-headings-pkg-depend.mk
  endif
else ifeq (1,${_ROBOTPKG_DEPTH})
  _HEADINGS_TARGETS+=
else ifeq (0,${_ROBOTPKG_DEPTH})
  _HEADINGS_TARGETS+=
else
  $(error "robotpkg directory not found")
endif

.PHONY: headings
headings: ${_HEADINGS_TARGETS};


# process a package Makefile
do-headings-pkg-%: %
	@								\
	h=`${GIT} log --reverse --pretty='format:%aN on %aD' master '$^'\
	   | ${AWK} 'NR==1 { for(i=1;i<NF-2;i++) printf $$i " ";	\
		print $$i }'`; 						\
	${TEST} -z "$$h" && {						\
	  h=`${GIT} config user.name`" on ";				\
	  h="$$h"`${_CDATE_CMD} '+%a, %e %b %Y'`;			\
	};								\
	printf	'# robotpkg $^ for:\t%s\n# Created:\t\t\t%s\n#\n'	\
		"$(firstword ${CATEGORIES})/${PKGBASE}" "$$h" >$^.new;	\
	${SED} <$^ >>$^.new -e '1,/^\([^#]\|$$\)/{/^\([^#]\|$$\)/p;d;}';\
	${CMP} -s $^ $^.new || {					\
		${MV} $^ $^~ && ${MV} $^.new $^;			\
		${ECHO_MSG} "done headings for $^";			\
	};								\
	${RM} -f $^.new
