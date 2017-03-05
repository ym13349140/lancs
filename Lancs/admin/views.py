#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask import render_template, request, redirect, url_for, jsonify, current_app
from flask_login import login_user, logout_user
from datetime import datetime
from ..user.authorize import admin_login
from . import admin
from ..models import User, Article, Case
from .. import db
from flask_babel import gettext
from ..util.file_manage import upload_img, get_file_type
import os


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


'''
    资讯中心管理
'''


@admin.route('/articles/')
@admin_login
def article():
    articles = Article.query.filter_by(message_type=0)  # 非招聘类资讯
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


'''
    招聘信息管理
    由于与资讯管理的模型结构相同，因此管理模块也耦合在一起
'''


@admin.route('/jobs/')
@admin_login
def job():
    articles = Article.query.filter_by(message_type=1)  # 招聘类资讯
    return render_template('admin/article/job_index.html',
                           title=gettext('Jobs Admin'),
                           articles=articles)


@admin.route('/jobs/create/', methods=['POST', 'GET'])
@admin_login
def job_create():
    if request.method == 'GET':
        return render_template('admin/article/job_create.html', title=gettext('Create Jobs'))
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']
        new_article = Article(title=title, content=content, message_type=1)  # 招聘类资讯
        db.session.add(new_article)
        db.session.commit()
        return redirect(url_for('admin.job'))


@admin.route('/jobs/<int:aid>/edit/', methods=['POST', 'GET'])
@admin_login
def job_edit(aid):
    cur_article = Article.query.filter_by(id=aid).first_or_404()
    if request.method == "GET":
        return render_template('admin/article/job_edit.html',
                               title=cur_article.title,
                               article=cur_article)
    elif request.method == "POST":
        title = request.form['title']
        content = request.form['content']
        cur_article.title = title
        cur_article.content = content
        cur_article.updatedTime = datetime.now()
        db.session.commit()
        return redirect(url_for('admin.job'))


'''
    项目管理
'''


@admin.route('/cases/')
@admin_login
def case():
    cases = Case.query.all()
    return render_template('admin/case/index.html',
                           title=gettext('Case Admin'),
                           cases=cases)


@admin.route('/case/create/', methods=['POST', 'GET'])
@admin_login
def case_create():
    if request.method == 'GET':
        return render_template('admin/case/create.html', title=gettext('Create Case'))
    if request.method == 'POST':
        name = request.form['name']
        tags = request.form['tags']
        introduction = request.form['introduction']
        description = request.form['description']
        new_case = Case(name=name, description=description, introduction=introduction, tag=tags, icon="/static/upload/case/test.png")
        db.session.add(new_case)
        db.session.commit()
        # path = os.path.join(current_app.config['CASE_FOLDER'], "%d" % new_case.id)
        # os.mkdir(path)
        return redirect(url_for('admin.case'))


@admin.route('/case/<int:case_id>/edit/', methods=['POST', 'GET'])
@admin_login
def case_edit(case_id):
    cur_case = Case.query.filter_by(id=case_id).first_or_404()
    if request.method == 'GET':
        if cur_case.tag != '':
            tags = cur_case.tag.split(";")
            return render_template('admin/case/edit_case_info.html',
                                   title=cur_case.name,
                                   case=cur_case,
                                   tags=tags)
        else:
            return render_template('admin/case/edit_case_info.html',
                                   title=cur_case.name,
                                   case=cur_case)
    elif request.method == "POST":
        cur_case.name = request.form['name']
        cur_case.description = request.form['description']
        cur_case.tag = request.form['tags']
        cur_case.introduction = request.form['introduction']
        db.session.commit()
        return jsonify(status="success")


@admin.route('/case/delete/', methods=['POST', 'GET'])
@admin_login
def case_delete():
    cur_case = Case.query.filter_by(id=request.form['cid']).first_or_404()
    icon_path = os.path.join(current_app.config['CASE_COVER_FOLDER'], '%d.png' % cur_case.id)
    if os.path.exists(icon_path):
        os.remove(icon_path)
    db.session.delete(cur_case)
    db.session.commit()
    return jsonify(status='success', del_case_id=cur_case.id)


@admin.route('/case/<int:case_id>/picture/', methods=['GET', 'POST'])
@admin_login
def case_icon(case_id):
    if request.method == 'GET':
        cur_case = Case.query.filter_by(id=case_id).first_or_404()
        return render_template('admin/case/edit_case_icon.html', case=cur_case,
                               title=gettext('Case Icon'))
    elif request.method == 'POST':
        # 上传图片和保存图片
        cur_case = Case.query.filter_by(id=case_id).first_or_404()
        icon = request.files['pic']

        file_type = get_file_type(icon.mimetype)
        if icon and '.' in icon.filename and file_type == 'img':
            icon_name = '%d.png' % cur_case.id
            icon_path = os.path.join(current_app.config['CASE_COVER_FOLDER'], icon_name)
            cur_case.icon = os.path.join('/static/upload/case', '%d.png' % cur_case.id)
            db.session.commit()
            status = upload_img(icon, 171, 304, icon_path)
            if status[0]:
                return jsonify(status='success')
            else:
                return jsonify(status='fail')
        else:
            return jsonify(status='file_error')
