# robotpkg sysdep/gazebo.mk
# Created:			Anthony Mallet on Thu  8 Jun 2017
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GAZEBO_DEPEND_MK:=	${GAZEBO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gazebo
endif

ifeq (+,$(GAZEBO_DEPEND_MK)) # ---------------------------------------------

PREFER.gazebo?=		system
DEPEND_USE+=		gazebo
DEPEND_ABI.gazebo?=	gazebo>=1

SYSTEM_SEARCH.gazebo=	\
  'bin/gazebo{-[0-9]*,}:1s/[^.0-9]//gp:echo %'				\
  'include/gazebo{-[0-9]*,}/gazebo/gazebo_config.h:/VERSION_FULL/s/[^.0-9]//gp'	\
  'lib/libgazebo.so'							\
  '{lib/cmake/gazebo,share/gazebo/cmake}/gazebo-config.cmake'		\
  'lib/pkgconfig/gazebo.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Fedora.gazebo=gazebo-devel
SYSTEM_PKG.Debian.gazebo=gazebo libgazebo-dev

endif # GAZEBO_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
