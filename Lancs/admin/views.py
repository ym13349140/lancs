#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask import render_template, request, redirect, url_for, jsonify
from flask_login import login_user, logout_user
from datetime import datetime
from ..user.authorize import admin_login
from . import admin
from ..models import User, Article
from .. import db
from flask_babel import gettext


@admin.route('/auth/', methods=["GET", "POST"])
def auth():
    if request.method == "GET":
        return render_template('admin/auth.html', title=gettext("Admin Auth"))

    elif request.method == "POST":
        _form = request.form
        u = User.query.filter_by(email=_form['email']).first()
        if u and u.verify_password(_form['password']) and u.permissions == 0:
            login_user(u)
            u.last_login = datetime.now()
            db.session.commit()
            return redirect(url_for('admin.system'))
        else:
            message = gettext('Invalid username or password.')
            return render_template('admin/auth.html', title=gettext('Admin Auth'),
                                   form=_form,
                                   message=message)


@admin.route('/logout/')
@admin_login
def logout():
    logout_user()
    return redirect(request.args.get('next') or request.referrer or url_for('admin.auth'))


@admin.route('/system/')
@admin_login
def system():
    return render_template("admin/system.html", title=u"站点管理")

"""
    TODO：如何优雅地使多个url对应同一end_point
"""


@admin.route('/')
@admin_login
def index():
    return render_template("admin/system.html", title=u"站点管理")


@admin.route('/articles/')
@admin_login
def article():
    articles = Article.query.all()
    return render_template('admin/article/index.html',
                           title=gettext('Articles Admin'),
                           articles=articles)


@admin.route('/article/create/', methods=['POST', 'GET'])
@admin_login
def article_create():
    if request.method == 'GET':
        return render_template('admin/article/create.html', title=gettext('Create Article'))
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']
        new_article = Article(title=title, content=content)
        db.session.add(new_article)
        db.session.commit()
        return redirect(url_for('admin.article'))


@admin.route('/article/<int:aid>/edit/', methods=['POST', 'GET'])
@admin_login
def article_edit(aid):
    cur_article = Article.query.filter_by(id=aid).first_or_404()
    if request.method == "GET":
        return render_template('admin/article/edit.html',
                               title=cur_article.title,
                               article=cur_article)
    elif request.method == "POST":
        title = request.form['title']
        content = request.form['content']
        cur_article.title = title
        cur_article.content = content
        cur_article.updatedTime = datetime.now()
        db.session.commit()
        return redirect(url_for('admin.article'))


@admin.route('/article/delete/', methods=['POST', 'GET'])
@admin_login
def article_delete():
    cur_article = Article.query.filter_by(id=request.form['id']).first_or_404()
    db.session.delete(cur_article)
    db.session.commit()
    return jsonify(status="success", del_article_id=cur_article.id)
