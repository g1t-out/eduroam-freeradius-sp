FROM alpine:3.18


RUN apk add freeradius freeradius-eap tcpdump wpa_supplicant \
            bash grep bind-tools tzdata openssl make
ENV TZ=America/Denver
RUN  /etc/raddb/certs/bootstrap

EXPOSE 1812/udp 1813/udp

WORKDIR /usr/sbin
CMD ["radiusd","-h"]