#
# Copyright (c) 2010 LAAS/CNRS
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
#                                            Anthony Mallet on Wed Mar 17 2010
#

GBX_PACKAGE=	meta-pkg
GBX_COMMENT=	(meta package)

include Makefile.common

CATEGORIES=	meta-pkgs
COMMENT=	Opensource, peer-reviewed, robotic software tools $(GBX_COMMENT)
META_PACKAGE=	yes

# make sure a 'make install' for this package will require the right version of
# all gearbox sub-packages
DEPEND_ABI.gbx-share?=		gbx-share>=${GBX_VERSION}
DEPEND_ABI.gbx-flexiport?=	gbx-flexiport>=1.0.0
DEPEND_ABI.gbx-hokuyo-aist?=	gbx-hokuyo-aist>=1.0.0

include ../../devel/gbx-share/depend.mk
include ../../devel/gbx-flexiport/depend.mk
include ../../hardware/gbx-hokuyo-aist/depend.mk
include ../../mk/robotpkg.mk
