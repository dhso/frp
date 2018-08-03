FROM alpine:3.7

ENV FRP_VERSION 0.20.0

RUN wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \ 
    tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
    cd frp_${FRP_VERSION}_linux_amd64 && \
    mv frps /frps && \
    mv frpc /frpc && \
    mv frps.ini /frps.ini && \
    mv frpc.ini /frpc.ini && \
    cd .. && \
    rm -rf *.tar.gz && \
    rm -rf frp_${FRP_VERSION}_linux_amd64
RUN mkdir frp
RUN mv frps frp/frps && \
    mv frpc frp/frpc && \
    mv frps.ini frp/frps.ini && \
    mv frpc.ini frp/frpc.ini && \

WORKDIR /
EXPOSE 80 443 6000 7000 7500

ENTRYPOINT ["/frp/frps"]
