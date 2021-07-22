FROM centos:centos7

# Install SSH
RUN yum install -y openssh-server

# Generate host keys
RUN ssh-keygen -A

# Permit root login
RUN sed -i "s/#PermitRootLogin/PermitRootLogin/g" /etc/ssh/sshd_config

# Expose ssh port
EXPOSE 22

# Expose http and https ports
EXPOSE 80 443

# Set root password && start sshd
ENV password=password123
CMD echo "$password" | passwd root --stdin && /usr/sbin/sshd -D