# robotpkg sysdep/py-pyaudio.mk
# Created:			Séverin Lemaignan on 8 Dec 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYPYAUDIO_DEPEND_MK:=	${PYPYAUDIO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-pyaudio
endif

ifeq (+,$(PYPYAUDIO_DEPEND_MK)) # ------------------------------------------

PREFER.py-pyaudio?=	system

DEPEND_USE+=		py-pyaudio
DEPEND_ABI.py-pyaudio?=	${PKGTAG.python-}pyaudio

SYSTEM_SEARCH.py-pyaudio=\
  '${PYTHON_SYSLIBSEARCH}/PyAudio*.egg-info:${_py-pyaudio.v}:${ECHO} %'	\
  '${PYTHON_SYSLIBSEARCH}/pyaudio.py'
_py-pyaudio.v=s/.*\/PyAudio-//;s/[^0-9.].*//;s/[.]$$//;p

SYSTEM_PKG.Debian.py-pyaudio=	python-pyaudio (python-${PYTHON_VERSION})
SYSTEM_PKG.Fedora.py-pyaudio=	pyaudio (python-${PYTHON_VERSION})
SYSTEM_PKG.Ubuntu.py-pyaudio=	python-pyaudio (python-${PYTHON_VERSION})

# pyaudio N/A on these platforms
NOT_FOR_PLATFORM+=	NetBSD-%
NOT_FOR_PLATFORM+=	Ubuntu-10.04-%
NOT_FOR_PLATFORM+=	Ubuntu-10.10-%

include ../../mk/sysdep/python.mk

endif # PYPYAUDIO_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
