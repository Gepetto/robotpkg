# robotpkg depend.mk for:	graphics/simple-humanoid-description
# Created:			Rohan Budhiraja on Wed Oct 19, 2016
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SIMPLE_HUMANOID_DESCRIPTION_DEPEND_MK:=	${SIMPLE_HUMANOID_DESCRIPTION_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		simple-humanoid-description
endif

ifeq (+,$(SIMPLE_HUMANOID_DESCRIPTION_DEPEND_MK)) # ------------------------

PREFER.simple-humanoid-description?=	robotpkg

SYSTEM_SEARCH.simple-humanoid-description=\
  'share/simple_humanoid_description/urdf/simple_humanoid.urdf' \
  'share/simple_humanoid_description/srdf/simple_humanoid.srdf' \
  'lib/pkgconfig/simple_humanoid_description.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		simple-humanoid-description

DEPEND_ABI.simple-humanoid-description?= simple-humanoid-description>=1.0.1
DEPEND_DIR.simple-humanoid-description?= ../../graphics/simple-humanoid-description

endif # SIMPLE_HUMANOID_DESCRIPTION_DEPEND_MK ------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
