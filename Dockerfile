FROM nginx

RUN apt-get update && \
    apt-get install -y \
        man \
        manpages-posix
COPY rclone /usr/bin/rclone
RUN chown root:root /usr/bin/rclone
RUN chmod 755 /usr/bin/rclone
RUN mkdir -p /usr/local/share/man/man1
RUN cp rclone.1 /usr/local/share/man/man1/
RUN mandb 

RUN rclone version
COPY entrypoint.sh /entrypoint.sh
COPY rclone.conf /config/rclone/rclone.conf
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
