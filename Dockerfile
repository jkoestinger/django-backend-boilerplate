FROM python:3

ENV PYTHONUNBUFFERED 1
ENV DEBUG false

RUN mkdir /app
WORKDIR /app

COPY . ./

RUN pip install -r requirements.txt
RUN python ./manage.py collectstatic --noinput && \
    python ./manage.py migrate
    # Remove this if using external db

EXPOSE 80
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]