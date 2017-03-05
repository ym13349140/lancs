#! /usr/bin/env python
# -*- coding: utf-8 -*-
import os
basedir = os.path.abspath(os.path.dirname(__file__))


class Config:
    def __init__(self):
        pass

    SECRET_KEY = os.environ.get('SECRET_KEY') or '!@#$%^&*12345678'
    SQLALCHEMY_TRACK_MODIFICATIONS = True

    # 翻译配置
    BABEL_DEFAULT_LOCALE = 'zh'
    BABEL_DEFAULT_TIMEZONE = 'CST'

    # If use QQ email, please see http://service.mail.qq.com/cgi-bin/help?id=28 firstly.
    MAIL_SERVER = 'smtp.sina.com'
    MAIL_PORT = 465
    MAIL_USE_SSL = True
    MAIL_USERNAME = os.environ.get('MAIL_USERNAME') or 'milanlanlanlan@sina.com'
    MAIL_PASSWORD = os.environ.get('MAIL_PASSWORD') or '1970025901a'
    FORUM_MAIL_SUBJECT_PREFIX = 'LANCS'
    FORUM_MAIL_SENDER = '<milanlanlanlan@sina.com>'

    # 这个路径用来保存 Markdown 编辑框拖拽上传的文件
    MD_UPLOAD_IMG = 'static/upload/md_images/'
    IMAGES_FOLDER = os.path.join(basedir, 'Lancs/', MD_UPLOAD_IMG)

    # 用户头像保存的地址
    AVATAR_PATH = "static/upload/avatar/"
    AVATAR_FOLDER = os.path.join(basedir, 'Lancs/', AVATAR_PATH)

    CASE_COVER_FOLDER = os.path.join(basedir, 'Lancs/static/upload/case')
    ARTICLE_COVER_FOLDER = os.path.join(basedir, 'Lancs/static/upload/article')

    @staticmethod
    def init_app(app):
        pass


class DevelopmentConfig(Config):
    def __init__(self):
        pass

    DEBUG = True
    SQLALCHEMY_DATABASE_URI = (os.environ.get('DEV_DATABASE_URL') or
                               'mysql://root:123456@localhost/lancs')


class ProductionConfig(Config):
    def __init__(self):
        pass

    SQLALCHEMY_DATABASE_URI = (os.environ.get('DEV_DATABASE_URL') or
                               'mysql://root:123456@localhost/lancs')


config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
    'default': DevelopmentConfig
}
