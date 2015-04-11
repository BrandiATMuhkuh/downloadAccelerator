while [ "$1" != "" ]; do
    case $1 in
        -u )		           shift
                                fname=$1
                                ;;
        -t )		           shift
                                WAITTIME=$1
                                ;;
        -s )		           shift
                                SAVENAME=$1
                                ;;
        -h | --help )           
			echo "-u <url>: set the url of the file"
			echo "-t <time>: set the time in seconds until the script restart the connection. When you download a file you will see after x seconds a drop in download speed. This is the perfect time. Default time is 11 seconds"
			echo "-s <savename>: the name the file should have after downloading. Default is 'downloadedFile'"
						        exit
						        ;;
        * )						exit 1
    esac
    shift
done


if [ $fname ]
then
	echo "Lets start"
else
	echo "user --help | -h"
	exit 1
fi

if [ ! $WAITTIME ]
then
	echo "no wait time specified. We use 11 sec as default"
	WAITTIME=11
fi 

if [ ! $SAVENAME ]
then
	echo "no wait time specified. We use 11 sec as default"
	SAVENAME="downloadedFile"
fi 



while true;
do
	curl -L -o $SAVENAME  -C  - $fname --max-time $WAITTIME 
	OUT=$?
	echo $OUT

	if [ $OUT == 33 ]
	then
		exit 0
	fi
done
