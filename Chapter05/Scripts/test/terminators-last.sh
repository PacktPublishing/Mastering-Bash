#!/bin/bash

case "$1" in
        start)
	    echo "We are starting..."
	    exit 0
            ;;
         
        stop)
	    echo "We are stopping..."
	    exit 0
            ;;
         
        status)
	    echo "We are checking the status..."
            ;;&

        restart)
	    echo "We are restarting..."
            ;&
         
        *)
            echo $"Usage: $0 {start|stop|restart|status}"
            exit 1
	    ;;
esac
exit 0
