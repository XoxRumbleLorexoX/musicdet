#!/bin/bash
#note no slash at the end

pid=$(pidof | grep -c "python\|mpv")
if [ $pid -gt 0 ];
then
  out1=$(BluetoothConnector -c 2c-33-61-2e-36-9e | grep -c "failed") #note use of arp -a as it is moreaccurate! After saying this i realised that ping is the fastest approach
  echo $out1
  if [ $out1 -gt 0 ];
  then
    sudo pidof -k mpv && sudo pidof -k python
  fi
else
  RNG=$(echo $RANDOM % 50 + 1  | bc)
  out=$(BluetoothConnector -c 2c-33-61-2e-36-9e | grep -c "failed")
  echo $out
  if [ $out -eq 0 ];
  then
    BluetoothConnector 80-c7-55-63-0f-a3 -c --notify && sudo mpsyt "//trap instrumentals 2019", $RNG, shuffle, 1,2,3,4,5,6-
  fi
fi
