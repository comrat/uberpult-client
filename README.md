# uberpult-client
Client example for [uberpult](https://github.com/comrat/uberpult) project.

The most important thing is [WebSocketClient](https://github.com/comrat/uberpult-client/blob/master/src/WebSocketClient.qml) component which allows you to listen uberpult server application and handle its messages.

# Installation
To build and install the app on your android device you need to install:
* [cordova](https://cordova.apache.org/docs/en/latest/guide/cli/#installing-the-cordova-cli)
* [adb](http://bernaerts.dyndns.org/linux/74-ubuntu/354-ubuntu-xenial-android-adb-fastboot-qtadb)
* [python](https://www.python.org/downloads/) with [jinja2](http://jinja.pocoo.org/docs/2.10/intro/) templater

Then connect to your phone [via adb](https://developer.android.com/studio/command-line/adb). Run this command after that:

`./smart-tv-deployer/smart-tv-deployer.py -p android`

If everything is fine you will see <i>uberpultclient</i> application on your android device.

This script was tested only on linux.
