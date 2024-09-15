FROM ubuntu:22.04

RUN apt-get -o Acquire::Retries=3 update && \
    apt-get -o Acquire::Retries=3 install -y --no-install-recommends git python3 python3-pip curl && \
    pip install iamai[onebot] && \
    pip install iamai-adapter-apscheduler && \
    iamai new iamai && cd iamai

COPY main.py /iamai
COPY config.toml /iamai
COPY docker-entrypoint.sh /iamai

WORKDIR /iamai
EXPOSE 3001
STOPSIGNAL SIGINT
ENTRYPOINT ["bash", "docker-entrypoint.sh"]
