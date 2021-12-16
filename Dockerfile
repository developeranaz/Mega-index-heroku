FROM developeranaz/mega-index:x
RUN apt update -y
COPY entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
