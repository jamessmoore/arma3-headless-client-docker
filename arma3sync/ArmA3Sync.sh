#sh
java -Djava.net.preferIPv4Stack=true -Xms256m -Xmx256m -XX:-HeapDumpOnOutOfMemoryError -XX:HeapDumpPath="/" -XX:+ShowMessageBoxOnError -Dsun.java2d.d3d=false -jar ArmA3Sync.jar