# robotpkg build/rake.mk
# Created:			Anthony Mallet on Wed, 23 Oct 2013
#

# This file configures the build phase to use GNU make program. This is the
# default. It must be included by packages, before build-vars.mk
#

# Defaults
MAKE_PROGRAM?=	${MAKE}
MAKE_FILE?=	Makefile
MAKE_ENV?=	# empty
MAKE_FLAGS?=	# empty

BUILD_TARGET?=	all

# always reset robotpkg gmake context when using gmake to build a package
MAKE_ENV+=	MAKELEVEL= MAKEOVERRIDES= MAKEFLAGS= MFLAGS=

# parallel builds
MAKE_FLAGS+=\
  $(if $(call isno,${MAKE_JOBS_SAFE}),,$(addprefix -j,${MAKE_JOBS}))
