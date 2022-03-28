#
# Copyright (c) 2022 LAAS/CNRS
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
# From $NetBSD: github.mk,v 1.15 2021/04/10 09:03:13 nia Exp $
#
#                                           Anthony Mallet on Fri Mar 25 2022
#

# github.com master site handling
#
# To use, set in Makefile:
#
# DISTNAME=     exampleproject-1.2
# MASTER_SITES= ${MASTER_SITE_GITHUB:=accountname/}
#
# The following variables alter github.mk behavior:
#
# GITHUB_PROJECT        defaults to PKGBASE
# GITHUB_TAG            defaults to PKGVERSION_NOREV
#                       sometimes you want to override with v${PKGVERSION_NOREV}
#                       SHA-1 commit ids are also acceptable
# GITHUB_RELEASE        defaults to not defined, set this to ${DISTNAME}
#                       when packaging a release not based on a git tag.
# GITHUB_TYPE           overrides the autodetected MASTER_SITE URL scheme:
#
# "tag"
# This is the default when GITHUB_RELEASE is not defined. Example URL:
# http://github.com/acct/${GITHUB_PROJECT}/archive/{GITHUB_TAG}.tar.gz
#
# "release"
# This is the default when GITHUB_RELEASE is set. Example URL:
# http://github.com/acct/${GITHUB_PROJECT}/...
#              ...releases/download/${GITHUB_RELEASE}/${DISTNAME}.tar.gz

GITHUB_PROJECT?=$(patsubst %-${PKGVERSION_NOREV},%,${DISTNAME})
GITHUB_TAG?=	${PKGVERSION_NOREV}
GITHUB_TYPE?=	$(if ${GITHUB_RELEASE},release,tag)

# Default HOMEPAGE
HOMEPAGE?=	${MASTER_SITE_GITHUB:=${GITHUB_PROJECT}/}

# Default DISTFILE encodes the project name and tag in the file name
GITHUB_DISTFILE?= ${GITHUB_PROJECT}-${GITHUB_TAG}${EXTRACT_SUFX}

DISTFILES?=	${GITHUB_DISTFILE}
EXTRACT_SUFX?=	.tar.gz

# Define the default fetch site
_GITHUB_SITE.release=\
  ${MASTER_SITES:=${GITHUB_PROJECT}/releases/download/${GITHUB_RELEASE}/}
_GITHUB_SITE.tag=\
  -${MASTER_SITES:=${GITHUB_PROJECT}/archive/${GITHUB_TAG}${EXTRACT_SUFX}}

SITES.${GITHUB_DISTFILE}?= ${_GITHUB_SITE.${GITHUB_TYPE}}
