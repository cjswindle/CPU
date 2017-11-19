#!/bin/bash

sudo modprobe usbmon
ls -l /dev/usbmon*
sudo chmod 644 /dev/usbmon*
