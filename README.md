# raspi-temperature
raspberry pi3に接続したDS18B20(温度センサ）から情報を取得し設定した温度によってエアコンをON/OFFするスクリプト  
  
FILE=/sys/bus/w1/devices/[devicesid]/w1_slave  
deviceisidは環境によって変わるので注意。  
また、赤外線信号は省略しているので適宜追加すること  
(START= とSTOP=)
