# Django Boilerplate Project

This project is only aiming to help you start quickly a project, by providing you a commonly used setup with Django in order to create a REST API with authentication.

Before doing anything it might be wise to start working in a virtual environment. To do so you can use Conda or setup a virtual environment with the following command at the project root:

    python3 -m venv env

and then use those commands to activate it and install the needed packages:

    source env/bin/activate
    pip install -r requirements.txt

To start using this project, start by reset the current git repository information

    rm -rf .git && git init

then run the migrations (Note: by default this project is using sqlite)

    ./manage.py migrate

This will setup your database and pre-create a super user with the following credentials (of course to be changed)

- username: admin
- password: admin

You can now run the server with the following command:

    ./manage.py runserver

Your api is now running on the endpoint http://localhost:8000/api

You can also access the panel admin (were you can change your credentials) at the address http://localhost:8000/admin

## Libraries used

The following libraries were added in order to create this boilerplate:

- django-rest-framework: https://www.django-rest-framework.org/
- DRF-extensions: https://chibisov.github.io/drf-extensions/docs/
- django-rest-framework-simplejwt: https://github.com/davesque/django-rest-framework-simplejwt
- django-cors-headers: https://github.com/ottoyiu/django-cors-headers/
