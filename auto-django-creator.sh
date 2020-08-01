#!/bin/bash

NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
REQUIREMENTS="""
astroid\n
autopep8\n
certifi\n
chardet\n
defusedxml\n
dj-database-url\n
Django\n
django-allauth\n
django-cors-headers\n
django-modeltranslation\n
django-rest-auth\n
django-storages\n
djangorestframework\n
gunicorn\n
idna\n
isort\n
jsonfield\n
lazy-object-proxy\n
mccabe\n
oauthlib\n
passlib\n
pep8\n
Pillow\n
pudb\n
pycodestyle\n
pyDOE\n
Pygments\n
pylint\n
python3-openid\n
pytz\n
requests\n
requests-oauthlib\n
scipy\n
six\n
sqlparse\n
urllib3\n
urwid\n
"""

PROJECT_NAME=test_${NEW_UUID}
if [[ ! -d ${PROJECT_NAME} ]]; then 
	mkdir ${PROJECT_NAME}
	echo "Project ${PROJECT_NAME} created..."
	cd ${PROJECT_NAME}
	echo -e ${REQUIREMENTS} > requirements.txt
	virtualenv env
	source env/bin/activate
	pip install -r requirements.txt
	django-admin startproject ${PROJECT_NAME}
	cd ${PROJECT_NAME}
	python manage.py migrate
	python manage.py runserver
	
else
	echo "Project is existed"
fi


