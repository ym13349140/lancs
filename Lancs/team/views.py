#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask import render_template, request, jsonify, current_app, render_template_string
from . import team
from ..models import Member
from flask_babel import gettext


@team.route('/')
def index():
    members = Member.query.all()
    return render_template("team/team_member.html",
                           title=gettext('Team Member'),
                           members=members)




