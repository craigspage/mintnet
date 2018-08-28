FROM parity/parity:v2.0.0

RUN mkdir -p /mnt/io.parity.ethereum
VOLUME ["/mnt/io.parity.ethereum"]

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 5001 8082 8083 8180 8545 8546 30311/tcp 30311/udp

RUN mkdir -p /etc/mintnet
ADD ./reservedpeers.txt /etc/mintnet/reservedpeers.txt
ADD ./mintnet.toml /etc/mintnet/mintnet.toml
ADD ./mintnet.json /etc/mintnet/mintnet.json
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
