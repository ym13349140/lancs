#! /usr/bin/env python
# -*- coding: utf-8 -*-

from flask import Blueprint
job = Blueprint('job', __name__)
from . import views
