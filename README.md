LUA for AOSP Roms
=================

How to build in an AOSP repo :

    cd $ANDROID_BUILD_TOP
    lunch #yourdevice#
    git clone https://github.com/tpruvot/android_external_lua external/lua
    cd external/lua
    mma
    mmp -B # for CyanogenMod, will adb push files on your device

This directory contains resources related to Lua.

- src/ contains the modified Lua 5.1.4 sources.

- ase/ contains Lua code written for the Android Scripting Environment.

