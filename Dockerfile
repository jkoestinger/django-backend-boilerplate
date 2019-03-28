FROM tiangolo/uwsgi-nginx:python3.7

ENV DEBUG false
ENV DEV true

COPY ./requirements.txt /app/
RUN pip install -r requirements.txt

# Setting up app and custom configurations
COPY . /app/

RUN mkdir static && mkdir media

VOLUME /app/static
VOLUME /app/media

# By default: applies migrations on container start
COPY docker-files/supervisord-extra.conf /etc/supervisor/conf.d/supervisord-extra.conf
COPY docker-files/uwsgi.ini /app