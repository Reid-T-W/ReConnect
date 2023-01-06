#!/usr/bin/python3
""" Blueprint for API """
from flask import Blueprint

app_views = Blueprint('app_views', __name__, url_prefix='/api/v1')

from api.v1.views.missingperson import *
from api.v1.views.contacts import *
from api.v1.views.contactsphone import *
from api.v1.views.address import *
from api.v1.views.picture import *
