FROM python:3

ENV PYTHONUNBUFFERED 1
ENV DEBUG false

RUN mkdir /app
WORKDIR /app

RUN pip install -r requirements.txt
RUN python ./manage.py collectstatic --noinput

COPY . ./

EXPOSE 80
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]