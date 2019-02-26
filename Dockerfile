FROM ubuntu

RUN apt-get update && apt-get install -y \ 
  apt-utils\
  vim curl \
  apache2 \
  apache2-utils \
  python3 \
  libapache2-mod-wsgi-py3 \
  python3-pip
RUN ln /usr/bin/python3 /usr/bin/python && ln /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip
RUN pip install ptvsd
WORKDIR /var/www/html
COPY . ./
RUN pip install -r requirements.txt
ENV DEBUG false
RUN python ./manage.py migrate && python ./manage.py collectstatic --noinput
ADD ./site.conf /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:www-data .
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]