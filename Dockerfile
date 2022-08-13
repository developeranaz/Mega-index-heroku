FROM ubuntu:latest
RUN apt update -y
RUN apt install unzip curl wget -y
COPY entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
