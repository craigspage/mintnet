FROM parity/parity:v2.0.0

RUN mkdir -p /mnt/io.parity.ethereum
VOLUME ["/mnt/io.parity.ethereum"]

ENTRYPOINT ["/entrypoint.sh"]

RUN mkdir -p /etc/mintnet
ADD ./mintnet.toml /etc/mintnet/mintnet.toml
ADD ./mintnet.json /etc/mintnet/mintnet.json
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
