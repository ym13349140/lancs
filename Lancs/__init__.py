#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_babel import Babel
from flask_login import LoginManager
from flask_mail import Mail
from config import config

db = SQLAlchemy()
mail = Mail()
login_manager = LoginManager()
login_manager.session_protection = 'strong'
login_manager.login_view = 'user.signin'


def create_app(config_name):
    app = Flask(__name__)
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)

    Babel(app)
    db.init_app(app)
    login_manager.init_app(app)
    mail.init_app(app)

    # Register all the filter.
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)
    from .util import filter_blueprint
    app.register_blueprint(filter_blueprint)
    from .user import user as user_blueprint
    app.register_blueprint(user_blueprint, url_prefix='/user')
    from .team import team as team_blueprint
    app.register_blueprint(team_blueprint, url_prefix='/team')
    from .article import article as article_blueprint
    app.register_blueprint(article_blueprint, url_prefix='/article')
    from .admin import admin as admin_blueprint
    app.register_blueprint(admin_blueprint, url_prefix='/admin')
    from .markdown_files import markdown_files as markdown_files_blueprint
    app.register_blueprint(markdown_files_blueprint, url_prefix='/markdown_files')
    from .conference import conference as conference_blueprint
    app.register_blueprint(conference_blueprint, url_prefix='/conference')
    from .job import job as job_blueprint
    app.register_blueprint(job_blueprint, url_prefix='/job')
    from .case import case as case_blueprint
    app.register_blueprint(case_blueprint, url_prefix='/case')

    return app
