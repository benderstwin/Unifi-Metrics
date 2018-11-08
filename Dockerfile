FROM python:3.7-alpine as base
MAINTAINER Bender
FROM base as builder
RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install --install-option="--prefix=/install" -r /requirements.txt
FROM base
COPY --from=builder /install /usr/local
COPY . /app
WORKDIR /app/Unifi-Metrics-Collector
VOLUME [ "/app" ]
ENTRYPOINT ["python3"]
CMD ["./unifi_collector.py"]
