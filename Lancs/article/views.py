#! /usr/bin/env python
# -*- coding: utf-8 -*-

from . import article


@article.route('/')
def index():
    pass


@article.route('/<int:article_id>')
def detail(article_id):
    pass
