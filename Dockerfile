FROM python:3
MAINTAINER Bender
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
WORKDIR /app/Unifi-Metrics-Collector
ENTRYPOINT ["python3"]
CMD ["/bin/bash"]
