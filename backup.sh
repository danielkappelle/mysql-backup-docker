#!/bin/bash

CREDS="-u$MYSQL_USER -p$MYSQL_PASSWORD -h$MYSQL_HOST"

# Get DBs
DBS=`docker exec $CONTAINER_NAME sh -c "exec mysql $CREDS -BNe \"show databases\"" 2>/dev/null`
CLEANDBS=`echo $DBS | egrep -v "(mysql|.*_schema|sys)"`
echo $CLEANDBS

for n in $CLEANDBS
do
  echo "nu: $n"
done



# MYSQL="exec mysql $CREDS -BNe \"show databases\""
# # # MYSQL="mysql $CREDS -BNe \"show databases\" | egrep -v \"(mysql|.*_schema|sys)\" | xargs -n1 -I {} mysqldump $CREDS {} -r $BACKUP_FOLDER/{}.sql > /dev/null 2>&1"
# # # COMMAND="docker exec $CONTAINER_NAME sh -c '$MYSQL'"

# TEST="exec $MYSQL"
# docker exec $CONTAINER_NAME sh -c "$TEST"

# docker exec some-mysql sh -c 'exec mysql -uroot -proot -hlocalhost -BNe "show databases"'