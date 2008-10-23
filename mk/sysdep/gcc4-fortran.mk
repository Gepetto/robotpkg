# $LAAS: gcc4-fortran.mk 2008/10/23 00:03:33 tho $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Web Oct 22 2008
#

DEPEND_ABI.gcc42-fortran=	gcc42-fortran>=4.0

include ${ROBOTPKG_DIR}/lang/gcc42-fortran/depend.mk
