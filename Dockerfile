FROM amd64/archlinux

#RUN curl https://rclone.org/install.sh | sudo bash
RUN pacman -Syy rclone

RUN pacman -Syy wget

#    && apt update -y \
#    && apt upgrade -y
#    && apt install -y wget\
#    && apt install -y rclone\
#    && apt autoremove -y
RUN rclone version
COPY entrypoint.sh /entrypoint.sh
COPY rclone.conf /config/rclone/rclone.conf
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
