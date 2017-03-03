#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask import render_template, redirect, request, url_for, current_app, abort, jsonify
from flask_login import login_user, logout_user, current_user, login_required
from datetime import datetime
from flask_babel import gettext
from ..util.email import send_email
from . import user
from ..models import User
from .. import db


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
            login_user(reg_user)

            token = reg_user.generate_reset_token()
            send_email(reg_user.email, 'Confirm Your Email',
                       'user/register_email',
                       user=reg_user, token=token)
            return render_template('user/register_sent.html')


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


@user.route('/password/reset/', methods=['GET', 'POST'])
def password_reset_request():
    pass
