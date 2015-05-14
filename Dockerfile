FROM buildpack-deps:sid

RUN set -x \
      && apt-get update \
      && apt-get install -y espeak ffmpeg libsndfile1 libsndfile1-dev python python-dev python-pip python-numpy python-lxml python-beautifulsoup \
      && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app
RUN git clone https://github.com/readbeyond/aeneas.git

COPY requirements.txt /usr/src/app/
RUN pip install -r requirements.txt

CMD [ "python" ]