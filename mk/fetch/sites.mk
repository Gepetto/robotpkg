# $LAAS: sites.mk 2010/09/09 14:58:24 mallet $
#
# Copyright (c) 2006-2007,2009-2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice,  this list of  conditions and the following disclaimer in
#      the  documentation  and/or  other   materials provided  with  the
#      distribution.
#
# THIS  SOFTWARE IS PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS OR      CONTRIBUTORS  BE LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS SOFTWARE, EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
# From $NetBSD: sites.mk,v 1.17 2006/11/25 14:46:50 jdolecek Exp $
#
#                                      Anthony Mallet on Fri Jan  9 2009
#

# This Makefile fragment defines read-only MASTER_SITE_* and
# MASTER_REPOSITORY_* variables representing some well-known master
# distribution sites for software.
#
MASTER_SITE_OPENROBOTS+=	\
	ftp://ftp.openrobots.org/pub/openrobots/		\
	http://www.openrobots.org/distfiles/

MASTER_REPOSITORY_OPENROBOTS+=	\
	git git://git.openrobots.org/git/robots/

MASTER_SITE_ROBOTPKG+=	\
	http://softs.laas.fr/openrobots/robotpkg/distfiles/

MASTER_SITE_JRL+=	\
	ftp://${JRL_FTP_USER}${JRL_FTP_PASSWD:%=:%}@softs.laas.fr/

MASTER_REPOSITORY_JRL+=	\
	git ssh://${JRL_GIT_USER:=@}softs.laas.fr/git/jrl/

MASTER_REPOSITORY_GITHUB_LAAS+= \
	git https://github.com/laas/

MASTER_REPOSITORY_GITHUB_JRL+= \
	git https://github.com/jrl-umi3218/

MASTER_SITE_SOURCEFORGE+=	\
	http://downloads.sourceforge.net/sourceforge/

MASTER_SITE_GNU+=       \
	http://ftp.gnu.org/pub/gnu/ \
	ftp://ftp.gnu.org/pub/gnu/ \
	ftp://ftp.funet.fi/pub/gnu/prep/ \
	ftp://ftp.kddlabs.co.jp/pub/gnu/gnu/ \
	ftp://ftp.dti.ad.jp/pub/GNU/ \
	ftp://ftp.mirror.ac.uk/sites/ftp.gnu.org/gnu/ \
	ftp://ftp.informatik.hu-berlin.de/pub/gnu/ \
	ftp://ftp.lip6.fr/pub/gnu/ \
	ftp://ftp.tuwien.ac.at/linux/gnu/gnusrc/ \
	ftp://ftp.chg.ru/pub/gnu/

MASTER_SITE_NETBSD_PKGSRC+=		\
	ftp://ftp.NetBSD.org/pub/NetBSD/packages/distfiles/LOCAL_PORTS/

# The primary backup site.
MASTER_SITE_BACKUP?=	\
	http://softs.laas.fr/openrobots/robotpkg/distfiles/
