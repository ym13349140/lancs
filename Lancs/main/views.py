#! /usr/bin/env python
# -*- coding: utf-8 -*-
from . import main
from flask import render_template
from flask_babel import gettext
from ..models import Article, Case


@main.route('/')
def index():
    articles = Article.query.order_by(Article.updatedTime.desc()).limit(10).all()
    cases = Case.query.limit(6).all()
    return render_template("main/index.html",
                           title=gettext('Laboratory of Advanced Networking and Computing Systems'),
                           articles=articles,
                           cases=cases)


@main.route('/about_us')
def about_us():
    return render_template("main/about_us.html", title=gettext('About Us'))


@main.route('/publications')
def publications():
    return render_template("main/publications.html", title=gettext('Publications'))


@main.route('/contact_us')
def contact_us():
    return render_template("main/contact_us.html", title=gettext('Contact Us'))


@main.route('/team')
def team():
    return render_template("main/team_member.html", title=gettext('Team Member'))


@main.app_errorhandler(404)
def page_404(err):
    return render_template('404.html', title='404'), 404


@main.app_errorhandler(403)
def page_403(err):
    return render_template('403.html', title='403'), 403


@main.app_errorhandler(500)
def page_500(err):
    return render_template('500.html', title='500'), 500
