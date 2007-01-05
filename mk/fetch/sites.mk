# $NetBSD: sites.mk,v 1.17 2006/11/25 14:46:50 jdolecek Exp $
#
# This Makefile fragment defines read-only MASTER_SITE_* variables
# representing some well-known master distribution sites for software.
#

MASTER_SITE_OPENROBOTS+=	\
	ftp://softs.laas.fr/pub/openrobots/robotpkg/

MASTER_SITE_NETBSD_PKGSRC+=		\
	ftp://ftp.NetBSD.org/pub/NetBSD/packages/distfiles/LOCAL_PORTS/

MASTER_SITE_SOURCEFORGE+=	\
	http://easynews.dl.sourceforge.net/sourceforge/ \
	http://heanet.dl.sourceforge.net/sourceforge/ \
	http://internap.dl.sourceforge.net/sourceforge/ \
	http://jaist.dl.sourceforge.net/sourceforge/ \
	http://keihanna.dl.sourceforge.net/sourceforge/ \
	http://kent.dl.sourceforge.net/sourceforge/ \
	http://mesh.dl.sourceforge.net/sourceforge/ \
	http://nchc.dl.sourceforge.net/sourceforge/ \
	http://optusnet.dl.sourceforge.net/sourceforge/ \
	http://ovh.dl.sourceforge.net/sourceforge/ \
	http://puzzle.dl.sourceforge.net/sourceforge/ \
	http://surfnet.dl.sourceforge.net/sourceforge/ \
	http://switch.dl.sourceforge.net/sourceforge/ \
	http://ufpr.dl.sourceforge.net/sourceforge/ \
	http://voxel.dl.sourceforge.net/sourceforge

# The primary backup site.
MASTER_SITE_BACKUP?=	\
	http://softs.laas.fr/openrobots/distfiles/
