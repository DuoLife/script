#! /bin/bash
if [ -d /opt/tomcat7/webapps/lengtooyinxiang ] ; then
	echo 'ok'
	`cd`
    if [ ! -d lengtooyinxiang ] ; then
        echo '源文件夹不存在～' 
        exit 0
    fi
	echo 'action~'
    `sudo rm -rf /opt/tomcat7/webapps/lengtooyinxiang`
	echo '删除完毕～'
    `sudo cp -rv lengtooyinxiang /opt/tomcat7/webapps/lengtooyinxiang`
    echo '拷贝完毕'
	sudo service tomcat7 restart
else
    echo '目标文件夹不存在～' 
    `sudo cp -rv lengtooyinxiang /opt/tomcat7/webapps/lengtooyinxiang`
    echo '拷贝完毕'
	echo 'restart'
	sudo service tomcat7 restart
fi
