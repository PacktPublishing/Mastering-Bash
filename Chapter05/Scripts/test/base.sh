#!/bin/bash

case "$1" in
        start)
	    :
	    exit 0
            ;;
         
        stop)
	    :
	    exit 0
            ;;
         
        status)
	    :
	    exit 0
            ;;

        restart)
	    :
	    exit 0
            ;;

        condrestart)
	    if $condition
	    then
	    exit 0
            fi
            exit 1
            ;;
         
        *)
            echo $"Usage: $0 {start|stop|restart|condrestart|status}"
            exit 1
	    ;;
esac
exit 0
