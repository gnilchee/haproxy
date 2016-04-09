FROM debian:testing

MAINTAINER https://github.com/gnilchee

RUN apt-get update && apt-get install -y haproxy --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir /run/haproxy && chown haproxy:haproxy /run/haproxy

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/etc/haproxy/haproxy.cfg"]
