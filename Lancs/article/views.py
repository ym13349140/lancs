#! /usr/bin/env python
# -*- coding: utf-8 -*-

from flask import render_template
from . import article
from ..models import Article
from flask_babel import gettext
from .. import db


@article.route('/')
def index():
    article_list = Article.query.order_by(Article.updatedTime.desc()).filter_by(message_type=0)  # 只展示非招聘类的新闻列表
    return render_template('article/index.html',
                           title=gettext('Articles'),
                           article_list=article_list)


@article.route('/<int:article_id>')
def detail(article_id):
    detail_article = Article.query.filter_by(id=article_id).first()
    detail_article.visitNum += 1
    db.session.commit()
    return render_template('article/detail.html',
                           title=detail_article.title[:10],
                           article=detail_article)
