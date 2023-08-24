#!/bin/bash

if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then
    mkdir -p /var/www/html
    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
    mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf
    adduser $FTP_USER --disabled-password
    chown -R $FTP_USER:$FTP_USER /var/www/html
fi

/usr/sbin/vsftpd etc/vsftpd/vsftpd.conf