# robotpkg Makefile for:	meta-pkgs/gearbox
# Created:			Anthony Mallet on Wed, 17 Mar 2010
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
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
