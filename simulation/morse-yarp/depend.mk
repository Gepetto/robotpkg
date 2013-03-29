# robotpkg depend.mk for:	simulation/morse-yarp
# Created:			Anthony Mallet on Tue, 12 Apr 2011
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
MORSE_YARP_DEPEND_MK:=		${MORSE_YARP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			morse-yarp
endif

ifeq (+,$(MORSE_YARP_DEPEND_MK)) # -----------------------------------------

PREFER.morse-yarp?=		robotpkg

DEPEND_USE+=			morse-yarp

DEPEND_ABI.morse-yarp?=		morse-yarp>=0.2
DEPEND_DIR.morse-yarp?=		../../simulation/morse-yarp

SYSTEM_SEARCH.morse-yarp=\
	${PYTHON_SYSLIBSEARCH}/morse/middleware/yarp_datastream.py

include ../../mk/sysdep/python.mk

endif # MORSE_YARP_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
