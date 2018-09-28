#!/bin/bash

set -e

apt install -y libnss-ldap libpam-ldap ldap-utils

echo "base DNBİLGİSİ
uri ldap://IPBİLGİSİ
ldap_version 3
rootbinddn cn=admin,DNBİLGİSİ
" > /etc/libnss-ldap.conf

echo "LDAPPAROLASI" > /etc/libnss-ldap.secret

echo "passwd:         compat ldap
group:          compat ldap
shadow:         compat ldap
gshadow:        files

hosts:          files mdns4_minimal [NOTFOUND=return] dns
networks:       files

protocols:      db files
services:       db files
ethers:         db files
rpc:            db files

netgroup:       nis" > /etc/nsswitch.conf

echo "session	[default=1]			pam_permit.so
session	requisite			pam_deny.so
session	required			pam_permit.so
session	optional      pam_script.so 
session	required	    pam_unix.so 
session	optional			pam_ldap.so 
session	optional	    pam_systemd.so 

session optional pam_mkhomedir.so skel=/etc/skel umask=077
session optional        pam_script.so" > /etc/pam.d/common-session

echo "password	sufficient                      pam_script.so 
password	[success=2 default=ignore]	pam_unix.so obscure use_authtok try_first_pass sha512
password	[success=1 user_unknown=ignore default=die]	pam_ldap.so try_first_pass
password	requisite			pam_deny.so
password	required			pam_permit.so
password	optional	pam_gnome_keyring.so 
# end of pam-auth-update config" > /etc/pam.d/common-password





