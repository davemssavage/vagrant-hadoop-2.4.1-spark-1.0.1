vagrant ssh --command='sudo -u root $HADOOP_PREFIX/bin/hdfs namenode -format myhadoop' node1
vagrant ssh --command='sudo -u root $HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode' node1
vagrant ssh --command='sudo -u root $HADOOP_PREFIX/sbin/hadoop-daemons.sh --config $HADOOP_CONF_DIR --script hdfs start datanode' node1

vagrant ssh --command='sudo -u root $HADOOP_YARN_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager' node2
vagrant ssh --command='sudo -u root $HADOOP_YARN_HOME/sbin/yarn-daemons.sh --config $HADOOP_CONF_DIR start nodemanager' node2
vagrant ssh --command='sudo -u root $HADOOP_YARN_HOME/sbin/yarn-daemon.sh start proxyserver --config $HADOOP_CONF_DIR' node2
vagrant ssh --command='sudo -u root $HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver --config $HADOOP_CONF_DIR' node2

vagrant ssh --command='sudo -u root $SPARK_HOME/sbin/start-all.sh' node1
