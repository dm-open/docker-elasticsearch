
To get mlockall to work, you need to allow memlock ulimited for the docker daemon on the host

add "limit memlock unlimited unlimited" to /etc/init/docker.io.conf on the host

