FROM nginx:1.19.6
RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget\
    && apt install -y rclone\
    && apt autoremove -y

COPY entrypoint.sh /entrypoint.sh
COPY rclone.conf /.config/rclone/rclone.conf
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
