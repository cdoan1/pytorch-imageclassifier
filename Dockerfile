FROM pytorch/pytorch

RUN mkdir -p /opt/image-classifier/.cache
ENV HOME=/opt/image-classifier
WORKDIR /opt/image-classifier
ADD . /opt/image-classifier

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    python3 python3-dev python3-pip \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/local/bin/python && \
    ln -s /usr/bin/pip3 /usr/local/bin/pip

RUN pip install -r requirements.txt

RUN chgrp -R 0 /opt/image-classifier \
  && chmod -R g+rwX /opt/image-classifier

EXPOSE 5000

CMD ["python", "/opt/image-classifier/image_classifier.py"]
