#!bin/sh

FILE=/sys/bus/w1/devices/28-0000086e7964/w1_slave
TEMP=`cat ${FILE} | grep t= | cut -d ' ' -f 10 | cut -d '=' -f 2`
TEMPERATURE=`expr ${TEMP} / 1000`

# ON=1 OFF=0
STATUS=`cat status.log`
echo ${STATUS}
if [ $TEMPERATURE -lt 15 ] ; then
      echo "15度未満"
      echo $TEMP
      # エアコンがOFFならONにする
      if [ $STATUS -eq 0 ]; then
          # REQUEST TO IRKit
          START=`curl -i "http:///messages" -H "X-Requested-With: curl" -d  ''`
          echo "1" > status.log
      fi
elif [ $TEMPERATURE -ge 25 ] ; then
      echo "25度以上"
      echo $TEMP
      # エアコンがONならOFFにする
      if [ $STATUS -eq 1 ]; then
        # REQUEST TO IRKit
        STOP=`curl -i "http:///messages" -H "X-Requested-With: curl" -d ''`
        echo "0" > status.log
      fi     
else
     echo $TEMP
fi


echo `date` ${TEMP} >> temperature.log
