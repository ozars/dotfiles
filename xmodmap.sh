#!/bin/sh
xmodmap -e "keycode 150 = XF86AudioPrev NoSymbol XF86AudioPrev NoSymbol XF86AudioPrev"
xmodmap -e "keycode 148 = XF86AudioNext NoSymbol XF86AudioNext NoSymbol XF86AudioNext"
logger "xmodmap is ran"
