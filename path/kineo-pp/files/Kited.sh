#!/bin/sh
export KPP_INSTALL_DIR=@KINEO_DIR@
if [ -z "$LD_LIBRARY_PATH" ]; then
    LD_LIBRARY_PATH=${KPP_INSTALL_DIR}/lib:${KPP_INSTALL_DIR}/bin/modulesd
else
    LD_LIBRARY_PATH=${KPP_INSTALL_DIR}/lib:${LD_LIBRARY_PATH}:${KPP_INSTALL_DIR}/bin/modulesd
fi
export LD_LIBRARY_PATH
exec ${KPP_INSTALL_DIR}/bin/Kited $@
