#! /usr/bin/env python
# -*- coding: utf-8 -*-

from flask import render_template
from . import job
from ..models import Article
from flask_babel import gettext


@job.route('/')
def index():
    article_list = Article.query.order_by(Article.updatedTime.desc()).filter_by(message_type=1)  # 只展示招聘类的新闻列表
    return render_template('article/index.html',
                           title=gettext('Jobs Offer'),
                           article_list=article_list)


