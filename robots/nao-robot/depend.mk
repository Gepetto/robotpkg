# robotpkg depend.mk for:	robots/nao-robot
# Created:			Séverin Lemaignan on Wed, 07 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
NAO_ROBOT_DEPEND_MK:=		${NAO_ROBOT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			nao-robot
endif

ifeq (+,$(NAO_ROBOT_DEPEND_MK)) # ------------------------------------------

DEPEND_USE+=			nao-robot

PREFER.nao-robot?=		robotpkg

DEPEND_ABI.nao-robot-ros?=	nao-robot>=0.2
DEPEND_DIR.nao-robot-ros?=	../../robots/nao-robot

SYSTEM_SEARCH.nao-robot-ros=\
  'include/nao_msgs/Bumper.h'						\
  '${PYTHON_SYSLIBSEARCH}/nao_msgs/msg/_BlinkAction.py'			\
  'share/nao_msgs/action/FollowPath.action'				\
  'share/nao_driver/package.xml:/<version>/s/[^0-9.]//gp'		\
  'share/nao_msgs/package.xml:/<version>/s/[^0-9.]//gp'			\
  'lib/pkgconfig/nao_driver.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/nao_msgs.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # NAO_ROBOT_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
