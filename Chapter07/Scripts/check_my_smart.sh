#!/bin/bash

# License: GPL
# 
# Author: Giorgio Zarrelli <zarrelli@linux.it>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

# Retrieve the full path to the system utilities 
AWK=$(which awk)
BC=$(which bc)
GREP=$(which grep)
SUDO=$(which sudo)
SMARTCTL="$SUDO /usr/sbin/smartctl"
TR=$(which tr)

# AWK field to print
A_FIELD='{print $4}'
H_FIELD='{print $6}'
S_FIELD='{print $5}'
T_FIELD='{print $2}'

# Bit to delete from S_KEY
S_DEL=")"

# Disk to check
DISK=${DISK:="/dev/sda"}

# SMART capability indicators
IS_SMART="^SMART support is:"
SMART_IND=(Available Enabled)
ALT_IS_SMART="=== START OF SMART DATA SECTION ==="

# SMART check keywords
H_KEY="overall-health"
S_KEY="Self-test execution status"
T_KEY="Temperature"

# SMART matches
H_MATCH="PASSED"
S_MATCH=0

# Enable verbose; 0 for disabled, 1 for enabled
VERB=${VERB:=0}

# Function selector
B_SEL=${B_SEL:="HEALTH"}

# Simple counter
COUNTER=0

# Nagios return codes
STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3

# Default WARNING and CRITICAL values
WARNING_THRESHOLD=${WARNING_THRESHOLD:=41}
CRITICAL_THRESHOLD=${CRITICAL_THRESHOLD:=50}

# Print help and usage
print_help()
{
	cat << HERE

	MY SMART CHECK v1.0
        -------------------

	Please enter one or more of the following options:
	-d | --disk
		eg. /dev/sda
	-m | --module
		HEALTH
		TEMPERATURE
		SELFCHECK
	-w | --warning
		eg. -w 41
	-c | --critical
		eg. -c 50
HERE
}

# Parse parameters on the command line
while (( $# > 0 ))
	do
    		case "$1" in
        		-h | --help)
		                print_help
            		        exit "${STATE_OK}"
            		        ;;
        		-d | --disk)
                		shift
                		DISK="$1"
                		;;
		        -m | --module)
               		        shift
	                        B_SEL="$1"
        	                ;;
		        -w | --warning)
               			shift
		                WARNING_THRESHOLD="$1"
                		;;
		        -c | --critical)
               			shift
		                CRITICAL_THRESHOLD="$1"
                		;;
        		*)  	echo "Unknown argument: $1"
            			print_help
            			exit "$STATE_UNKNOWN"
            			;;
        	esac
		shift
	done
# Check for the path to bring us to a block device with SMART capability
disk_exists()
{
	if [ -b "$DISK" ]; 
		then
			(( VERB )) && echo "$DISK is a block device"
			smart_enabled "$DISK"

		else
			(( VERB )) && echo "$DISK does not point a block device"
			echo “SMART UNKNOWN: Disk not found $DISK”
			exit "$STATE_UNKNOWN"
	fi		
}

# Check if we have all the system tools we need
path_exists()
{
for i in "$@"
do
	if [ -e "$i" ];
		then 
			(( VERB )) && echo "$i is a valid path"
			disk_exists "$DISK"
		else
			(( VERB )) && echo "$i is not reachable, is this the correct path?"
			echo “SMART UNKNOWN: Please check the plugin”
			exit “$STATE_UNKNOWN”
	fi
done
}

smart_check()
{
	if (("$#" != 2));
		then	
			echo “SMART UNKNOWN: Please check the number of arguments for smart_check”
			exit "$STATE_UNKNOWN"
		else
			if [[ "$1" == "HEALTH" ]];
				then
					H_CHECK=$($SMARTCTL -a "$2" | "$GREP" "$H_KEY" | "$AWK" "$H_FIELD")
					if [[ "$H_CHECK" == "$H_MATCH" ]];
						then
							echo "SMART OK: Overall-health check $H_MATCH"
							exit "$STATE_OK"
						else
							echo "SMART CRITICAL: Overall-health check NOT $H_MATCH"
							exit "$STATE_CRITICAL"
					fi				
			elif [[ "$1" == "TEMPERATURE" ]];
				then	
					if (( $(echo "scale=2; "$WARNING_THRESHOLD" >= "$CRITICAL_THRESHOLD"" | $BC ) )) ;
					        then
					                echo "SMART UNKNOWN: The value of WARNING ($WARNING_THRESHOLD) must be lower than CRITICAL ($CRITICAL_THRESHOLD)"
						        exit "$STATE_UNKNOWN"
						else
							T_CHECK=$($SMARTCTL -a "$2" | "$GREP" "$T_KEY" | "$AWK" "$T_FIELD")
							if ! [[ "$T_CHECK" = *[[:digit:]]* ]]; 
								then
				              				echo "SMART UNKNOWN: The $T_KEY check is not available on $DISK"
						        		exit "$STATE_UNKNOWN"
							fi

							if (( T_CHECK < WARNING_THRESHOLD ));
							then
									echo "SMART OK: Temperature is $T_CHECK | TEMP=$T_CHECK"
									exit "$STATE_OK"
							elif (( T_CHECK < CRITICAL_THRESHOLD ));
								then
									echo "SMART WARNING: Temperature is $T_CHECK | TEMP=$T_CHECK"
									exit "$STATE_WARNING"
							else 
									echo "SMART CRITICAL: Temperature is $T_CHECK | TEMP=$T_CHECK"
									exit "$STATE_CRITICAL"
							fi

					fi	
			elif [[ "$1" == "SELFCHECK" ]];
				then	
					
					S_CHECK=$($SMARTCTL -a "$2" | "$GREP" "$S_KEY" | "$AWK" "$S_FIELD" | "$TR" -d "$S_DEL") 
					if ! [[ "$S_CHECK" = *[[:digit:]]* ]]; 
						then
				              		echo "SMART UNKNOWN: The $S_KEY check is not available on $DISK"
				        		exit "$STATE_UNKNOWN"
					fi

					if (( S_CHECK == S_MATCH ));
						then
							echo "SMART OK: Overall-health check $S_MATCH"
							exit "$STATE_OK"
						else
							echo "SMART CRITICAL: Overall-health check NOT $S_MATCH"
							exit "$STATE_CRITICAL"
					fi				
					
			else
					echo “SMART UNKNOWN: Please check the function selector”
					exit "$STATE_UNKNOWN"
			fi               
	fi
}

smart_enabled()
{
	SMART=($($SMARTCTL -a "$1" | "$GREP" "$IS_SMART" | "$AWK" "$A_FIELD"))
	for i in "${SMART[@]}"
	do
		for j in "${SMART_IND[@]}"
		do
			if [[ "$i" == "$j" ]];
				then
					(( COUNTER++ ))
			fi
		done
	done
	if (( COUNTER != ${#SMART_IND[@]} ))
		then
			ALT_SMART="$($SMARTCTL -a "$1" | "$GREP" "$ALT_IS_SMART")"
				if ! [[ -z $ALT_SMART ]]
					then
						(( VERB )) && echo "$DISK has SMART capability"
						smart_check "$B_SEL" "$DISK"
					else
						(( VERB )) && echo "Check the device, it seems it does not support SMART"
						(( VERB )) && echo "The counter matched: $COUNTER times"
						echo “SMART UNKNOWN: "$1" has not SMART capability”
						exit "$STATE_UNKNOWN"
				fi
		else
				(( VERB )) && echo "$DISK has SMART capability"
				smart_check "$B_SEL" "$DISK"
	fi
}

path_exists "$AWK" "$BC" "$GREP" "$SMARTCTL" "$SUDO" "$TR"
