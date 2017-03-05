#! /usr/bin/env python
# -*- coding: utf-8 -*-
from datetime import datetime
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from flask import current_app
from . import db, login_manager

""" 用户管理
@User:用户登录、注册、认证邮箱等
"""


class User(UserMixin, db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(128), unique=True, index=True, nullable=False)
    password_hash = db.Column(db.String(128), nullable=False)
    email = db.Column(db.String(128), unique=True, index=True, nullable=False)
    description = db.Column(db.String(128))

    is_password_reset_link_valid = db.Column(db.Boolean, default=True)
    last_login = db.Column(db.DateTime(), default=datetime.now)
    date_joined = db.Column(db.DateTime(), default=datetime.now)

    # 权限: 0. 管理员, 1. 用户
    permissions = db.Column(db.Integer, default=1, nullable=False)
    avatar_url = db.Column(db.String(128),
                           default="http://www.gravatar.com/avatar/")

    conferences = db.relationship('Conference', backref='user', lazy='dynamic')

    @property
    def password(self):
        raise AttributeError('password is not a readable attribute')

    @password.setter
    def password(self, password):
        self.password_hash = generate_password_hash(password)

    def verify_password(self, password):
        return check_password_hash(self.password_hash, password)

    def generate_reset_token(self, expiration=600):
        s = Serializer(current_app.config['SECRET_KEY'], expiration)
        return s.dumps({'id': self.id})

    @staticmethod
    def verify_token(token):
        s = Serializer(current_app.config['SECRET_KEY'])
        try:
            data = s.loads(token)
        except:
            return None
        uid = data.get('id')
        if uid:
            return User.query.get(uid)
        return None


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(user_id)


""" 咨询信息
@Article: 用来发布站点公告或者一些资讯、新闻信息。
"""


class Article(db.Model):
    __tablename__ = "articles"
    id = db.Column(db.Integer, primary_key=True)        # 资讯 ID
    title = db.Column(db.String(128), nullable=False)   # 资讯标题
    content = db.Column(db.Text(), nullable=False)      # 资讯正文
    visitNum = db.Column(db.Integer, default=0)         # 浏览次数
    message_type = db.Column(db.Integer, default=0, nullable=False)  # 消息类型：0代表普通资讯，1代表招聘信息

    updatedTime = db.Column(db.DateTime(), default=datetime.now)


""" 项目展示
@Case：用于管理项目内容
"""


class Case(db.Model):
    __tablename__ = "cases"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(256), nullable=False)
    description = db.Column(db.Text(), nullable=False)
    icon = db.Column(db.String(64), nullable=False)
    tag = db.Column(db.String(256))   # 案例标签，两个标签之间用分号隔开

""" 会议预约
@Conference: 会议记录类，用于储存会议基本信息
"""


class Conference(db.Model):
    __tablename__ = "conferences"
    id = db.Column(db.Integer, primary_key=True)    # 会议记录ID
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))  # 预约帐号ID
    name = db.Column(db.String(128), nullable=False)    # 预约人姓名
    contact = db.Column(db.String(20), nullable=False)  # 预约人联系电话
    introduction = db.Column(db.String(256), default=None)  # 会议内容简介
    start_time = db.Column(db.DateTime(), nullable=False)    # 会议开始日期时间
    end_time = db.Column(db.DateTime(), nullable=False)      # 会议结束时间

