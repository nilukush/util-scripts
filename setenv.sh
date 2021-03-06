#JAVA_OPTS="$JAVA_OPTS -Dmongohost=61.16.237.51 -Dmongoport=27017"
#JAVA_OPTS="$JAVA_OPTS -Dcartmongohost=61.16.237.51 -Dcartmongoport=27018 -DmongoReviews.replicaset=10.125.1.131:27018"
#JAVA_OPTS="$JAVA_OPTS  -DmongoReviews.replicaset=10.125.1.131:27018 -Dmongo.replicaset=61.16.237.51:27017,61.16.237.51:27018 -DmongoCart.replicaset=61.16.237.51:27050,61.16.237.51:27051"
JAVA_OPTS="$JAVA_OPTS -XX:PermSize=512m -XX:MaxPermSize=512m -Xms1536m -Xmx1536m"
#JAVA_OPTS="$JAVA_OPTS -Dmongo.replicaset=61.16.237.60:27017 -DmongoCart.replicaset=61.16.237.60:27017"
JAVA_OPTS="$JAVA_OPTS -DmongoIPMS.replicaset=10.125.1.150:27040 -DmongoCatalog.replicaset=10.125.1.150:27030"
JAVA_OPTS="$JAVA_OPTS -Dmongo.replicaset=10.125.1.151:27017"
JAVA_OPTS="$JAVA_OPTS -DmongoReviews.replicaset=10.125.1.151:27017"
JAVA_OPTS="$JAVA_OPTS -DmongoTracking.replicaset=54.251.10.20:27097"
JAVA_OPTS="$JAVA_OPTS -DuseOrderWebService=true"
JAVA_OPTS="$JAVA_OPTS -DmongoCart.replicaset=54.251.10.20:27017"
JAVA_OPTS="$JAVA_OPTS -DmongoCatalog.replicaset=54.251.99.186:9096"
JAVA_OPTS="$JAVA_OPTS -DmongoMobileApiSec.replicaset=54.86.136.55:27157"
JAVA_OPTS="$JAVA_OPTS -DmongoMobileApi.replicaset=54.86.136.55:27157"
#JAVA_OPTS="$JAVA_OPTS -DmongoCommon.replicaset=54.251.10.20:27017"
JAVA_OPTS="$JAVA_OPTS -Daerospike-hosts=127.0.0.1"
CATALINA_OPTS="-DLOGS_PATH=/home/nilesh/Desktop/tomcat/logs/"
