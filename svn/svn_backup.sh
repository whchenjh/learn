#!/bin/bash
#本机是运维svn 服务器，为保证svn数据备份，通过计划任务定期将svn目录打包然后通过ftp的方式上传

# svn info
SVNDIR=/diska/svn
BACKDIR=/tmp/
DATE=`date +%Y-%m-%d`
OLDDATE=`date +%Y-%m-%d -d '-7 days'`

# tar 
cd $BACKDIR
tar czf svn_${DATE}.tar.gz $SVNDIR > /dev/null
sleep 2
rm -rf ${BACKDIR}/${OLDDATE}

# ftp server info
HOST=**************
FTP_USERNAME=***************************
FTP_PASSWORD=***************************

# upload
lftp -e "put /tmp/svn_${DATE}.tar.gz;rm svn_${OLDDATE}.tar.gz;exit" $HOST -u ${FTP_USERNAME},${FTP_PASSWORD}

