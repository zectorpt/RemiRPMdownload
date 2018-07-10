#!/bin/bash
#
# josemedeirosdealmeida@gmail.com | jose.almeida@gfi.pt
# Jose Almeida
#

SEARCH='php70-php'
URL='https://rpms.remirepo.net/enterprise/7/remi/x86_64/'

curl -L $URL|grep $SEARCH|awk '{print $6}' > tmplst1
sleep 1
#remove strings
sed 's/href="//' tmplst1 > tmplst2
sleep 1
sed 's/[</a></td><td]//g' tmplst2 > tmplst3
sleep 1
sed 's/".*//' tmplst3 > tmplst4
sleep 1
#insert remi url
awk '$0="https://rpms.remirepo.net/enterprise/7/remi/x86_64/"$0' tmplst4 > tmplst5
sleep 1
cat tmplst5|sort|uniq > tmplst6
sleep 1
wget -i tmplst6
rm -f tmplst*
