FROM python:3.11.7-alpine3.19

RUN /usr/sbin/adduser -g python -D python

USER python
RUN /usr/local/bin/python -m venv /home/python/venv

COPY --chown=python:python requirements.txt /home/python/docker-gnucash-web/requirements.txt
RUN /home/python/venv/bin/pip install --no-cache-dir --requirement /home/python/docker-gnucash-web/requirements.txt

COPY --chown=python:python config.py /home/python/docker-gnucash-web/config.py
COPY --chown=python:python run.py /home/python/docker-gnucash-web/run.py
WORKDIR /home/python/docker-gnucash-web
ENTRYPOINT ["/home/python/venv/bin/python", "/home/python/docker-gnucash-web/run.py"]

ENV GNUCASH_WEB_CONFIG="/home/python/docker-gnucash-web/config.py" \
    PATH="/home/python/venv/bin:${PATH}" \
    PYTHONDONTWRITEBYTECODE="1" \
    PYTHONUNBUFFERED="1" \
    TZ="Etc/UTC"

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>" \
      org.opencontainers.image.source="https://github.com/williamjacksn/docker-gnucash-web"
