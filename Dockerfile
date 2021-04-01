FROM nginx
#RUN docker run -it amd64/archlinux
#RUN curl https://rclone.org/install.sh | sudo bash
#RUN sudo pacman -Syy rclone
RUN apt update -y
RUN curl https://rclone.org/install.sh | sudo bash -s beta

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
