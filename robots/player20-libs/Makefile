V=2.0.5
PKGNAME=	player20-libs-${V}
DISTNAME=	player-${V}
EXTRACT_SUFX=	.tar.bz2
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=playerstage/}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://playerstage.sourceforge.net/index.php?src=player
COMMENT=	Cross-platform robot device interface & server

USE_LANGUAGES=	c c++

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-alldrivers --disable-jplayer  --disable-libplayerc-py

include ../../mk/robotpkg.mk
