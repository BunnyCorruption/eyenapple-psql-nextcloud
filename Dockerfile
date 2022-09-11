FROM nextcloud:production-apache
RUN apt-get update && apt-get install -y \
   smbclient