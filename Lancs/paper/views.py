#! /usr/bin/env python
# -*- coding: utf-8 -*-

from flask import render_template
from . import paper
from ..models import Paper
from flask_babel import gettext


@paper.route('/')
def index():
    paper_list = Paper.query.all()
    return render_template('paper/index.html',
                           title=gettext('Publications'),
                           paper_list=paper_list)

