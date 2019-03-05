FROM python:3

ENV PYTHONUNBUFFERED 1
ENV DEBUG false
ENV DEV false

RUN mkdir /app
WORKDIR /app

COPY . ./

RUN mkdir static && mkdir media && pip install -r requirements.txt
RUN python ./manage.py collectstatic --noinput

VOLUME /app/media

EXPOSE 80
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
