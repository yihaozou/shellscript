#############################################################################
###  本脚本负责清理$HOME/log下面以年月日（2YYYMMDD）命名的日志文件        ###
###                                                                       ###
#############################################################################

### $HOME/log/.tmplog ###
cd $home/log/.tmplog
ls -lt |awk '{print $9}' |sed 's/.*/rm -rf &/'|sh

###  $HOME/log ###
cd $HOME/log/
ls -lr|grep ^d| awk '{print $9}'|grep ^2[0-9][0-9][0-9]0-9][0-9][0-9][0-9]$| sed '1,7d'| sed 's/.*/rm -rf &/'|sh
ls -lt|grep -v ^d| awk '{print $9}' |sed '1,42d'| sed 's/.*/rm -rf &/'|sh

###  $HOME/mmonitor/logs ###
cd $HOME/mmonitor/logs
tmpdate=`date +%m%d`
for i in `ls`
do
    filedate=`ls $i|awk '{print substr($0,length($0)-3,length($0)}'`
	datediff=`expr $tmpdate - $filedate 2>/dev/null`
	if [ $? -eq 0]; then
	    if[$datediff -gt 7]; then
		    > $i
		fi
		if [$datediff -gt 9]; then  
		    rm -rf $i
		fi
	else
	    continue
	fi
done		
