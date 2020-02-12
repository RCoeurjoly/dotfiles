#!/bin/bash
sudo ln -fs /home/drcoeurjoly/DF5555xx/ /data/programs/oms/DF5555xx/
sudo ln -fs /home/drcoeurjoly/MD5555xx/ /data/programs/oms/MD5555xx/
sudo ln -fs /home/drcoeurjoly/SS5555xx/ /data/programs/oms/SS5555xx/
sudo ln -fs /home/drcoeurjoly/RT5555xx/ /data/programs/oms/RT5555xx/

sudo /home/drcoeurjoly/DF5555xx/bin/DF5555xx /home/drcoeurjoly/DF5555xx/etc/DF5555xx.cfg &
/home/drcoeurjoly/MD5555xx/bin/MD5555xx /home/drcoeurjoly/MD5555xx/etc/MD5555xx.cfg &
/home/drcoeurjoly/SS5555xx/bin/SS5555xx /home/drcoeurjoly/SS5555xx/etc/SS5555xx.cfg &
sudo /home/drcoeurjoly/RT5555xx/bin/RT5555xx /home/drcoeurjoly/RT5555xx/etc/RT5555xx.cfg &
