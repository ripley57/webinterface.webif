#!/bin/bash

# Description:
#	Script to ensure that the OpenELEC "httpd" web server is running.
#
#       This script is expected to be called from a crontab entry such as this:
#       */5 * * * *     /storage/.kodi/addons/webinterface.webif/bin/monitorhttpd.sh
#       Basic steps to update crontab:
#       o VISUAL=vi crontab -e
#       o <Add your new crontab line>
#       o Save and verify using "crontab -l" 
#       Remember that Cron needs to be enabled in the OpenELEC settings:
#       SYSTEM > OpenELEC > Services > Cron > Enable Cron
#
#       To launch httpd on startup, we need to update /storage/.config/autostart.sh
#       to call this bash script monitorhttpd.sh, for example:
#       (
#       /storage/.kodi/addons/webinterface.webif/bin/monitorhttpd.sh; 
#       /storage/genrssxml.py;
#       ) &
#
#       We should also change the Kodi settings to "wait for the network", so the
#       autostart.sh script waits for the network to become available before running.
#       The "wait for network" setting can be found here:
#       SYSTEM > OpenELEC > Network > Advanced Network Settings > Wait for network before start Kodi
#       (Thinking about this again, we probably don't need to do this, since the httpd
#       web server appears to be completely separate from the build-in Kodi web server).
#       
# Comments:
#     o This web server (httpd) appears to be completely separate to the
#       built-in Kodi web server (which seems to be built into kodi.bin).
#     o More info on autostart.sh can be found here:
#       https://wiki.openelec.tv/documentation/configuration/autostart-sh-and-shutdown-sh
#     o More info on the OpenELEC setting "wait for network" can be found here:
#       https://openelec.tv/documentation/configuration/configuring-openelec
#     o We will point to our own httpd configuration file, because editing the default
#       file /etc/httpd.conf is difficult because it lives inside a squashfs read-only
#       filesystem.
#     o If we want to run httpd on port 80 then we'll need to ensure that it does not
#       clash with the Kodi built-in web server port number, which can be set here:
#       SYSTEM > Settings > Services > Web server > Port
#
# JeremyC 04-05-2018

# Simply start httpd if it isn't running.
if ! ps afx | grep -v grep | grep -q -w httpd  ; then
    /sbin/httpd -p 8080 -c /storage/.kodi/addons/webinterface.webif/resources/httpd.conf 
fi

