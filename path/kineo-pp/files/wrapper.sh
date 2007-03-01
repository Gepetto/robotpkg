#!/bin/sh
export KPP_INSTALL_DIR=@KINEO_DIR@
export LD_LIBRARY_PATH=${KPP_INSTALL_DIR}/lib
exec ${KPP_INSTALL_DIR}/bin/`basename $0` $@
