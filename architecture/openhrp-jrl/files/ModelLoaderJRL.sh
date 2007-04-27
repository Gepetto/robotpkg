#!/bin/bash

. config.sh
cd $OPENHRPHOME/ModelLoader/server2
exec ./ModelLoaderJRL $NS_OPT
