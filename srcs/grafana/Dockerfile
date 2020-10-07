FROM alpine:latest

RUN	wget -P /tmp/  https://dl.grafana.com/oss/release/grafana-6.7.1.linux-amd64.tar.gz ; \
	tar -zxvf /tmp/grafana-6.7.1.linux-amd64.tar.gz
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN	set -ex ; \
	addgroup -S grafana ; \
	adduser -S -G grafana grafana ; \
	apk add --no-cache libc6-compat ca-certificates su-exec bash ; \
	apk add openrc

COPY	grafana.db /grafana-6.7.1/data/

COPY	setup.sh .

RUN	chmod 775 setup.sh

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE	3000

CMD ["sh", "setup.sh"]