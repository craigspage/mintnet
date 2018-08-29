FROM parity/parity:v1.11.6

RUN mkdir -p /mnt/io.parity.ethereum
VOLUME ["/mnt/io.parity.ethereum"]

ENTRYPOINT ["/entrypoint.sh"]

RUN mkdir -p /etc/mintnet
ADD ./reservedpeers.txt /etc/mintnet/reservedpeers.txt
ADD ./mintnet.toml /etc/mintnet/mintnet.toml
ADD ./mintnet.json /etc/mintnet/mintnet.json
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
