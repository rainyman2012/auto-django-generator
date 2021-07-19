#!/bin/bash

REQUIREMENTS="""
Django\n
django-allauth\n
django-cors-headers\n
django-modeltranslation\n
django-rest-auth\n
ipython\n
django-storages\n
djangorestframework\n
sqlparse\n
"""
PROJECT_NAME=$1
if [ -z $PROJECT_NAME ]
then
        PROJECT_NAME=test_$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
fi
echo "${PROJECT_NAME} is creating ... "
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
