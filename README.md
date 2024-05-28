# scrcpy_Auto_Wi-Fi_Connector
scrcpy_Auto_Wi-Fi_Connector, made by Peter Yu.

> This is a bat file that simplifies the process of using scrcpy to mirror an Android phone onto a Windows computer via TCP/IP.
> 
> It automates the connection process, allowing users to easily establish a connection between their Android phone and Windows computer.

 <img src= "https://github.com/peter890331/scrcpy_Auto_Wi-Fi_Connector/blob/figures/showcase.png" width="500px">

## Foreword
### scrcpy
scrcpy ([Github][1], [scrcpy-win64-v2.0 download link][2]), this application mirrors Android devices connected via USB or over TCP/IP, and allows to control the device with the keyboard and the mouse of the computer.    

However, when using TCP/IP connect mode, users are usually required to input some commands by cmd, which is not friendly and troublesome for some users.

[1]: https://github.com/Genymobile/scrcpy
[2]: https://github.com/Genymobile/scrcpy/releases/download/v2.0/scrcpy-win64-v2.0.zip

## Overview
This bat file can simplify the process of complicated cmd setting when using TCP/IP connect mode. It will automatically determine whether there is an IP in the computer that is in a connectable state, if so, it will automatically mirror the phone screen, if not, then the user just needs to connect the phone to the computer via USB first and then enter the IP of the phone, it will automatically mirror the phone screen.

Equipment and Software Requirements:
 1. A Windows computer with scrcpy ([Github][2], [scrcpy-win64-v2.0 download link][3]), this application mirrors Android devices connected via USB or over TCP/IP, and allows to control the device with the keyboard and the mouse of the computer.
 2. The Android phone that want to mirror.

## How to use, For users
  For users, you can directly download scrcpy_Auto_Wi-Fi_Connector.bat, then put it into the scrcpy folder, and click to use.
### Steps:
  1. Download scrcpy and unzip it.
  2. Download scrcpy_Auto_Wi-Fi_Connector.bat, then put it into the scrcpy folder.
  3. Double click on scrcpy_Auto_Wi-Fi_Connector.bat.
  4. 
     A. If there is an IP in the computer that is in a connectable state, that means you might have used earlier, then your phone will automatically mirror the phone screen.
     
     B. If there is not an IP in the computer that is in a connectable state, that means you haven't used earlier, then you just needs to connect your phone to your computer via USB first, and enable USB debug authorisation, then enter the IP of your phone, after that, disconnect your phone to your computer via USB within 10 seconds, then your phone will automatically mirror the phone screen.
  5. Enjoy the convenience of scrcpy_Auto_Wi-Fi_Connector.bat.

## Notes
### scrcpy
scrcpy ([Github][1], [scrcpy-win64-v2.0 download link][2]), this application mirrors Android devices connected via USB or over TCP/IP, and allows to control the device with the keyboard and the mouse of the computer.  
Here are some command steps can use to test the Wifi connection mode:
 1. cd /d C:\Users\XXX\scrcpy-win64-vX.XX
 2. adb tcpip 5555
 3. adb connect 192.XXX.XX.XXX:5555
 4. scrcpy -t -b2M -m800

Here are two commands used to check if a device is connected and how to disconnect it:
- adb devices
- adb dsconnect
   
Then here are two useful shortcuts to turn off the phone screen while connected:
- Turn device screen off (keep mirroring):	MOD+o
- Turn device screen on:	MOD+Shift+o  
  (MOD key is usually Alt)
  
And a traditional Chinese teaching video on [Youtube][3].

[3]: https://youtu.be/WkTd5OxDZ-8