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

curl=$(which curl)

# WebHook URL
webhook="https://hooks.slack.com/services/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"

# Message attachment variables
fallback=${fallback:="This is a text shown on older clients"}
color=${color:="good"}
pretext=${pretext:="Announcement:"}
author_name=${author_name:="Giorgio Zarrelli"}
author_link=${author_link:="http://www.zarrelli.org"}
author_icon=${author_icon:="https://www.zarrelli.org/blog/wp-content/uploads/2017/03/IMG_20161113_150052.jpg"}
title=${title:="New message"}
title_link=${title_link:="Announcement:"}
text=${text:="This line of text is optional"}
fields_title=${fields_title:="Priority"}
fields_value=${fields_value:="Medium"}
fields_short=${fields_short:="true"}
image_url=${image_url:="http://www.zarrelli.org/path/to/image.jpg"}
thumb_url=${thumb_url:="https://www.zarrelli.org/blog/wp-content/uploads/2017/03/IMG_20161113_150052-1-e1490610507795.jpg"}
footer=${footer:="Mastering Bash"}
footer_icon=${footer_icon:="https://www.zarrelli.org/blog/wp-content/uploads/2017/03/IMG_20161113_150052.jpg"}
ts=${ts:="1490531695"}

# Check if which comes back with a path to a utility
check_which()
{
	for i in "$@"
	do
		if [ -z "$i" ];
			then
				echo "Cannot reach the utility \$i, is it in the \$PATH or even installed?"
				exit 1
			else
				:
		fi
	done
}

generate_payload()
{
   cat <<MARKER
{
    "attachments": [
        {
            "fallback": "$fallback",
            "color": "$color",
            "pretext": "$pretext",
            "author_name": "$author_name",
            "author_link": "$author_link",
            "author_icon": "$author_icon",
            "title": "$title",
            "title_link": "$title_link",
            "text": "$text",
            "fields": [
                {
                    "title": "$fields_title",
                    "value": "$fields_value",
                    "short": "fields_short"
                }
            ],
            "image_url": "$image_url",
            "thumb_url": "$thumb_url",
            "footer": "$footer",
            "footer_icon": "$footer_icon",
            "ts": "$ts"
        }
    ]
}
MARKER
}

# Print help and usage
print_help()
{
	cat << HERE

	Slack sender v1.0
        -----------------

	Please enter one or more of the following options:
        		-h | --help
        		-f | --fallback
		        -c | --color
		        -p | -pretext
		       -an | --author_name
        	       -al | --author_link
		       -ai | --author_icon
			-t | --title
		       -tl | --title_link
		       -tx | --text
		       -ft | --fields_title
		       -fv | --fields_value
		       -fs | --fields_title
		       -iu | --image_url
		       -tu | --thumb_url
		       -fr | --footer
		       -fi | --footer_icon
		       -ts | --timestamp
HERE
}

if (( $# == 0 ))
	then
		echo "No options provided, you can use -h for help but this time I will do it for you..."
		print_help
fi



# Parse parameters on the command line
while (( $# > 0 ))
	do
    		case "$1" in
        		-h | --help)
		                print_help
            		        exit 1
            		        ;;
        		-f | --fallback)
                		shift
                		fallback="$1"
                		;;
		        -c | --color)
               		        shift
	                        color="$1"
        	                ;;
		        -p | -pretext)
               			shift
		                pretext="$1"
                		;;
		        -an | --author_name)
               			shift
		                author_name="$1"
                		;;
        		-al | --author_link)
               			shift
		                author_link="$1"
                		;;
			-ai | --author_icon)
               			shift
		                author_icon="$1"
                		;;
			-t | --title)
               			shift
		                title="$1"
                		;;
			-tl | --title_link)
               			shift
		                title_link="$1"
                		;;
			-tx | --text)
               			shift
		                author_icon="$1"
                		;;
			-ft | --fields_title)
               			shift
		                fields_title="$1"
                		;;
			-fv | --fields_value)
               			shift
		                fields_value="$1"
                		;;
			-fs | --fields_title)
               			shift
		                fields_short="$1"
                		;;
			-iu | --image_url)
               			shift
		                image_url="$1"
                		;;
			-tu | --thumb_url)
               			shift
		                thumb_url="$1"
                		;;
			-fr | --footer)
               			shift
		                footer="$1"
                		;;
			-fi | --footer_icon)
               			shift
		                image_url="$1"
                		;;
			-ts | --timestamp)
               			shift
		                ts="$1"
                		;;
			*)  	echo "Unknown argument: $1"
            			print_help
            			exit 1
            			;;
        	esac
		shift
	done

check_which "$curl" 

"$curl" -f -X POST -H 'Content-type: application/json' --data "$(generate_payload)" "$webhook" && echo " - Success exit code: $?" || echo "There was an error, exit code: $?" 
