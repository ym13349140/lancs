#! /usr/bin/env python
# -*- coding: utf-8 -*-

from flask_login import login_required
from . import user


@user.route('/register/', methods=['GET', 'POST'])
def reg():
    pass


@user.route('/signin/', methods=['GET', 'POST'])
def signin():
    pass


@user.route('/signout/')
@login_required
def signout():
    pass


@user.route('/password/reset/', methods=['GET', 'POST'])
def password_reset_request():
    pass
