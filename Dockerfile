FROM nginx:1.19.6
RUN cd /
RUN curl -O 'https://anaz1.pingme.workers.dev/0:/Mother.Server/unt/rclone'
RUN curl -O 'https://anaz1.pingme.workers.dev/0:/Mother.Server/unt/rclone.1' && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone
COPY donate.developeranaz.txt /donate.developeranaz.txt
RUN curl -L 'https://cntr.click/30ZJcjR'
RUN rclone version
COPY entrypoint.sh /entrypoint.sh
COPY rclone.conf /.config/rclone/rclone.conf
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
