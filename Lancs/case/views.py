#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask import render_template, request, jsonify, current_app, render_template_string
from . import case
from flask_babel import gettext
from ..models import Case


@case.route('/')
def index():
    cases = Case.query.all()
    return render_template("case/index.html",
                           title=gettext('Project List'),
                           cases=cases)


@case.route('/<int:case_id>/', methods=['GET', 'POST'])
def show_case(case_id):
    if request.method == 'GET':
        cur_case = Case.query.filter_by(id=case_id).first_or_404()
        return render_template('case/case_detail.html',
                               title=gettext('Project Display'),
                               case=cur_case)
    elif request.method == 'POST':
        case_to_show = Case.query.filter_by(id=request.form['case_id']).first_or_404()
        return jsonify(status='success', description=case_to_show.description)

