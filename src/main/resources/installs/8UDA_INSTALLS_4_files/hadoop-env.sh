
export JAVA_HOME=/data/svr/jdk1.8.0_144



export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"/etc/hadoop"}


for f in $HADOOP_HOME/contrib/capacity-scheduler/*.jar; do
  if [ "$HADOOP_CLASSPATH" ]; then
    export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$f
  else
    export HADOOP_CLASSPATH=$f
  fi
done

# The maximum amount of heap to use, in MB. Default is 1000.
export HADOOP_HEAPSIZE=250
export HADOOP_NAMENODE_INIT_HEAPSIZE=50


export HADOOP_OPTS="$HADOOP_OPTS -Djava.net.preferIPv4Stack=true"


export HADOOP_NAMENODE_OPTS="-Dhadoop.security.logger=${HADOOP_SECURITY_LOGGER:-INFO,RFAS} -Dhdfs.audit.logger=${HDFS_AUDIT_LOGGER:-INFO,NullAppender} $HADOOP_NAMENODE_OPTS"
export HADOOP_DATANODE_OPTS="-Dhadoop.security.logger=ERROR,RFAS $HADOOP_DATANODE_OPTS"

export HADOOP_SECONDARYNAMENODE_OPTS="-Dhadoop.security.logger=${HADOOP_SECURITY_LOGGER:-INFO,RFAS} -Dhdfs.audit.logger=${HDFS_AUDIT_LOGGER:-INFO,NullAppender} $HADOOP_SECONDARYNAMENODE_OPTS"

export HADOOP_NFS3_OPTS="$HADOOP_NFS3_OPTS"
export HADOOP_PORTMAP_OPTS="-Xmx300m $HADOOP_PORTMAP_OPTS"


export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS"

if [ "$HADOOP_HEAPSIZE" = "" ]; then
  export HADOOP_CLIENT_OPTS="-Xmx300m $HADOOP_CLIENT_OPTS"
fi

export HADOOP_SECURE_DN_USER=${HADOOP_SECURE_DN_USER}


export HADOOP_PID_DIR=${HADOOP_PID_DIR}
export HADOOP_SECURE_DN_PID_DIR=${HADOOP_PID_DIR}

export HADOOP_IDENT_STRING=$USER
