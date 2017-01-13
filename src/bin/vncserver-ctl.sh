#!/bin/bash
VNC_PW=algolab2017
#resolve_vnc_connection
VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
VNC_PORT="590"${DISPLAY:1}
NO_VNC_PORT="690"${DISPLAY:1}

(echo $VNC_PW && echo $VNC_PW) | vncpasswd

##start vncserver and noVNC webclient
$NO_VNC_HOME/utils/launch.sh --vnc $VNC_IP:$VNC_PORT --listen $NO_VNC_PORT 
# vncserver -kill :1 && rm -rfv /tmp/.X* ; echo "remove old vnc locks to be a reattachable container"
vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION
tail -f ~/.vnc/*$DISPLAY.log

# -----

# tail -f /var/log/supervisor/supervisord.log
# ##log connect options
# echo -e "\n------------------ VNC environment started ------------------"
# echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"
# echo -e "\nnoVNC HTML client started:\n\t=> connect via http://$VNC_IP:$NO_VNC_PORT/vnc_auto.html?password=..."

# for i in "$@"
# do
# case $i in
#     # if option `-t` or `--tail-log` block the execution and tail the VNC log
#     -t|--tail-log)
#     echo -e "\n------------------ /root/.vnc/*$DISPLAY.log ------------------"
#     # tail -f /root/.vnc/*$DISPLAY.log
#     tail -f /var/log/supervisor/supervisord.log
#     ;;
#     *)
#     # unknown option ==> call command
#     exec $i
#     ;;
# esac
# done


# #resolve_vnc_connection
# VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
# VNC_PORT="590"${DISPLAY:1}
# NO_VNC_PORT="690"${DISPLAY:1}

# (echo $VNC_PW && echo $VNC_PW) | vncpasswd

# ##start vncserver and noVNC webclient
# # $NO_VNC_HOME/utils/launch.sh --vnc $VNC_IP:$VNC_PORT --listen $NO_VNC_PORT &
# # vncserver -kill :1 && rm -rfv /tmp/.X* ; 
# # echo "remove old vnc locks to be a reattachable container"
# # vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION
# echo "Starting vncserver.."
# vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION

# # tail -f /root/IBController/launcher.log

# startxfce4 

# # sleep 5

# # /usr/bin/java -cp /root/Jts/ibgateway/962/jars/jts4launch-962.jar:/root/Jts/ibgateway/962/jars/locales.jar:/root/Jts/ibgateway/962/jars/log4j-api-2.5.jar:/root/Jts/ibgateway/962/jars/log4j-core-2.5.jar:/root/Jts/ibgateway/962/jars/total-2015c.jar:/root/Jts/ibgateway/962/jars/twslaunch-962.jar:/root/Jts/ibgateway/962/jars/twslaunch-install4j-1.7.jar:/root/IBController/IBController.jar -Xmx768m ibcontroller.IBGatewayController /root/IBController/IBController.ini paper

# ##log connect options
# # echo -e "\n------------------ VNC environment started ------------------"
# # echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"
# # echo -e "\nnoVNC HTML client started:\n\t=> connect via http://$VNC_IP:$NO_VNC_PORT/vnc_auto.html?password=..."

# # /root/scripts/entrypoint.sh



# # echo [containerizing]

# # exec "$@"
# # /bin/sh "/root/IBController/IBControllerGatewayStart.sh"
# # ps aux|grep java
# #             ls -la /root/IBController/Logs
# # tail -f /root/.vnc/*$DISPLAY.log

# # for i in "$@"
# # do
    
# #     echo "i: $@"
    
# #     case $i in
    
# #         # if option `-t` or `--tail-log` block the execution and tail the VNC log
# #         -t|--tail-log)
            
# #             echo -e "\n------------------ /root/.vnc/*$DISPLAY.log ------------------"
# #             tail -f /root/.vnc/*$DISPLAY.log
# #             # tail -f /root/IBController/Logs/*
            
# #         ;;
# #         *)
        
# #             # unknown option ==> call command
        
# #             exec $i
# #             ps aux|grep java
# #             ls -la /root/IBController/Logs
# #         ;;
    
# #     esac
    
# # done

# # tail -f /root/.vnc/*$DISPLAY.log