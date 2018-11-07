FROM python:3.6-alpine as base
MAINTAINER Bender
FROM base as builder
RUN mkdir /install
WORKDIR /install
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
COPY requirements.txt /requirements.txt
RUN pip install --install-option="--prefix=/install" -r /requirements.txt
FROM base
COPY --from=builder /install /usr/local
COPY . /app
#WORKDIR /app/Unifi-Metrics-Collector
VOLUME [ "/app" ]
CMD ["/bin/ash"]