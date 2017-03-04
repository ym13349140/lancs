#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask import render_template, redirect, request, url_for, current_app, abort, jsonify
from flask_login import login_user, logout_user, current_user, login_required
from datetime import datetime
from flask_babel import gettext
from PIL import Image
from ..util.email import send_email
from ..util.file_manage import get_file_type
from . import user
from ..models import User
from .. import db
import os


@user.route('/register/', methods=['GET', 'POST'])
def reg():
    if request.method == 'GET':
        return render_template('user/reg.html',
                               title=gettext('Register Account'),
                               form=None)
    elif request.method == 'POST':
        _form = request.form
        username = _form['username']
        email = _form['email']
        password = _form['password']
        password2 = _form['password2']

        message_e, message_u, message_p = "", "", ""
        # Check username is valid or not.
        if User.query.filter_by(username=username).first():
            message_u = gettext('Username already exists.')

        # Check email is valid or not.
        if User.query.filter_by(email=email).first():
            message_e = gettext('Email already exists.')

        if message_u or message_p or message_e:
            return render_template("user/reg.html", form=_form,
                                   title=gettext('Register Account'),
                                   message_u=message_u,
                                   message_p=message_p,
                                   message_e=message_e)

        # A valid register info, save the info into db.
        else:
            reg_user = User(username=username, email=email, password=password)
            db.session.add(reg_user)
            db.session.commit()

            token = reg_user.generate_reset_token()
            send_email(reg_user.email, 'Confirm Your Email',
                       'user/register_email',
                       user=reg_user, token=token)
            return render_template('user/register_sent.html', title=gettext('Mail has been sent'))


@user.route('/register/<token>')
def reg_confirm(token):
    reg_user = User.verify_token(token)
    reg_user.is_valid_registered = True
    db.session.commit()
    login_user(reg_user)
    return redirect(request.args.get('next') or url_for('main.index'))


@user.route('/signin/', methods=['GET', 'POST'])
def signin():
    if request.method == 'GET':
        if current_user.is_authenticated:
            return redirect(request.args.get('next') or url_for("main.index"))
        return render_template('user/signin.html',
                               title=gettext('User Sign In'),
                               form=None)
    elif request.method == 'POST':
        _form = request.form
        u = User.query.filter_by(email=_form['email']).first()
        if u and u.verify_password(_form['password']):
            login_user(u)
            u.last_login = datetime.now()
            db.session.commit()
            return redirect(request.args.get('next') or url_for('main.index'))
        else:
            message = gettext('Invalid username or password.')
            return render_template('user/signin.html', title=gettext('User Sign In'),
                                   form=_form, message=message)


@user.route('/signout/')
@login_required
def signout():
    logout_user()
    return redirect(request.args.get('next') or request.referrer or url_for('main.index'))


@user.route('/setting/')
@login_required
def setting():
    if request.method == 'GET':
        return render_template('user/setting.html',
                               title=gettext("Setting"),
                               form=None)


@user.route('/setting/info', methods=['GET', 'POST'])
@login_required
def setting_info():
    if request.method == 'GET':
        return jsonify(content=render_template('user/ajax_setting_info.html', form=None))

    elif request.method == 'POST':
        _form = request.form
        description = _form["website"]
        current_user.description = description
        db.session.commit()
        message_success = gettext('Update info done!')
        return jsonify(content=render_template('user/ajax_setting_info.html',
                                               message_success=message_success))


@user.route("/setting/avatar/", methods=['GET', 'POST'])
@login_required
def setting_avatar():
    if request.method == 'GET':
        return jsonify(content=render_template('user/ajax_setting_avatar.html',
                                               form=None))

    elif request.method == 'POST':
        _file = request.files['file']

        avatar_folder = current_app.config['AVATAR_FOLDER']
        file_type = get_file_type(_file.mimetype)
        if _file and '.' in _file.filename and file_type == "img":
            im = Image.open(_file)
            im.thumbnail((128, 128), Image.ANTIALIAS)

            image_path = os.path.join(avatar_folder, "%d.png" % current_user.id)
            im.save(image_path, 'PNG')
            unique_mark = os.stat(image_path).st_mtime
            current_user.avatar_url = '%d.png?t=%s' % (current_user.id, unique_mark)

            db.session.commit()
            message_success = gettext('Update avatar done!')
            return jsonify(content=render_template('user/ajax_setting_avatar.html',
                                                   message_success=message_success))
        else:
            message_fail = gettext("Invalid file")
            return jsonify(content=render_template('user/ajax_setting_avatar.html',
                                                   message_fail=message_fail))


@user.route("/setting/password/", methods=['GET', 'POST'])
@login_required
def setting_password():
    if request.method == 'GET':
        return jsonify(content=render_template('user/ajax_setting_passwd.html', form=None))

    elif request.method == 'POST':
        _form = request.form
        cur_password = _form['old-password']
        new_password = _form['password1']
        new_password_2 = _form['password2']

        message_cur, message_new = "", ""
        if not current_user.verify_password(cur_password):
            message_cur = "The old password is not correct."

        if message_cur or message_new:
            return jsonify(content=render_template('user/ajax_setting_passwd.html', form=_form,
                                                   message_cur=message_cur,
                                                   message_new=message_new))
        else:
            current_user.password = new_password
            db.session.commit()
            message_success = gettext("Update password done!")
            return jsonify(content=render_template('user/ajax_setting_passwd.html',
                                                   message_success=message_success))


@user.route('/password/reset/', methods=['GET', 'POST'])
def password_reset_request():
    pass
