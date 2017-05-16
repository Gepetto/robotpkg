# robotpkg depend.mk for:	simulation/bullet
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BULLET_DEPEND_MK:=	${BULLET_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		bullet
endif

ifeq (+,$(BULLET_DEPEND_MK)) # ---------------------------------------------

PREFER.bullet?=		system

SYSTEM_SEARCH.bullet=\
  'include/bullet/Bullet-C-Api.h'			\
  'lib/libBulletDynamics.{so,a}'			\
  'lib/pkgconfig/bullet.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		bullet

DEPEND_ABI.bullet?=	bullet>=2.75
DEPEND_DIR.bullet?=	../../simulation/bullet

endif # BULLET_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
