#! /usr/bin/env python
# -*- coding: utf-8 -*-
from . import filter_blueprint


@filter_blueprint.app_template_filter('principal')
def principal(member_list):
    result = []
    for m in member_list:
        if m.rank == 0:
            result.append(m)
    return result


@filter_blueprint.app_template_filter('prof')
def prof(member_list):
    result = []
    for m in member_list:
        if m.rank == 1:
            result.append(m)
    return result


@filter_blueprint.app_template_filter('vice_prof')
def vice_prof(member_list):
    result = []
    for m in member_list:
        if m.rank == 2:
            result.append(m)
    return result


@filter_blueprint.app_template_filter('teacher')
def teacher(member_list):
    result = []
    for m in member_list:
        if m.rank == 3:
            result.append(m)
    return result


@filter_blueprint.app_template_filter('researcher')
def researcher(member_list):
    result = []
    for m in member_list:
        if m.rank == 4:
            result.append(m)
    return result


@filter_blueprint.app_template_filter('common')
def common(member_list):
    result = []
    for m in member_list:
        if m.rank != 0:
            result.append(m)
    return result
