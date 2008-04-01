#!/bin/sh
export KPP_INSTALL_DIR=@KINEO_DIR@
if [ -z "$LD_LIBRARY_PATH" ]; then
    LD_LIBRARY_PATH=${KPP_INSTALL_DIR}/lib
else
    LD_LIBRARY_PATH=${KPP_INSTALL_DIR}/lib:${LD_LIBRARY_PATH}
fi
export LD_LIBRARY_PATH
exec ${KPP_INSTALL_DIR}/bin/`basename $0` $@
