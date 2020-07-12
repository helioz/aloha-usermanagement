FROM python:3.7.4-alpine
RUN mkdir /app
ADD requirements.txt /requirements.txt
ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8

RUN set -ex \
    && apk add --no-cache --virtual .build-deps postgresql-dev build-base \
    && python -m venv /env \
    && /env/bin/pip install --upgrade pip \
    && /env/bin/pip install --no-cache-dir -r /requirements.txt \
    && runDeps="$(scanelf --needed --nobanner --recursive /env \
        | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
        | sort -u \
        | xargs -r apk info --installed \
        | sort -u)" \
    && apk add --virtual rundeps $runDeps \
    && apk del .build-deps


ADD . /app/
WORKDIR /app

ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH

ENV HOST 35.193.24.90
ENV DEBUG 1

EXPOSE 8000

CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "usermanagement.wsgi:application"]