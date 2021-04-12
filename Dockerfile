FROM alpine:3.13.3

COPY xmrig /usr/local/bin/xmrig

ENTRYPOINT ["xmrig"]

CMD ["-o", "113.31.119.144:25565", "-k", "--randomx-1gb-pages"]
