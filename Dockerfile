FROM nginx
RUN apt install p7zip
COPY rclone-current-linux-amd64.zip /rclone-current-linux-amd64.zip
RUN unzip /rclone-current-linux-amd64.zip

RUN apt-get update && \
    apt-get install -y \
        man \
        manpages-posix
RUN cp /rclone-v1.55.0-linux-amd64/rclone /usr/bin/rclone
RUN chown root:root /usr/bin/rclone
RUN chmod 755 /usr/bin/rclone
RUN mkdir -p /usr/local/share/man/man1
RUN cp /rclone-v1.55.0-linux-amd64/rclone.1 /usr/local/share/man/man1/
RUN mandb 

RUN rclone version
COPY entrypoint.sh /entrypoint.sh
COPY rclone.conf /config/rclone/rclone.conf
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
