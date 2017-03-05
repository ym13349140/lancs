#! /usr/bin/env python
# -*- coding: utf-8 -*-

from . import conference
from flask import render_template, request, jsonify, abort, redirect, url_for
from ..models import User, Conference
from flask_login import current_user, login_required
from datetime import datetime
from .. import db


@conference.route('/', methods=['GET', 'POST'])
@login_required
def index():
    if request.method == 'GET':
        return render_template('conference/index.html', title=u"会议室预约")


@conference.route('/process/', methods=['POST'])
def process():
    if request.method == 'POST':
        if current_user.is_authenticated:
            op = request.form.get('op', None)
            if op:
                if op == 'get conferences':
                    now = datetime.now()
                    today = now.replace(hour=7, minute=0, second=0, microsecond=0)
                    conference_this_week = Conference.query.filter(Conference.start_time >= today).all()
                    conference_jsons = []
                    if conference_this_week:
                        for c in conference_this_week:
                            deletable = 'false'
                            name, title, contact = c.name, c.introduction, u'无'
                            background_color, border_color, text_color, status = '#6AA4C1', '#6AA4C1', '#FFFFFF', u'未开始'
                            if c.start_time <= now < c.end_time:
                                background_color, border_color, text_color, status = '#46C37B', '#34A263', '#FFFFFF', u'进行中'
                            elif c.end_time < now:
                                background_color, border_color, text_color, status = '#D1D1D1', '#B0B0B0', '#000000', u'已结束'

                            if current_user.is_authenticated and current_user.id == c.user_id and current_user.permissions == 1:
                                background_color, border_color, text_color = '#FFFFA3', '#E1E185', '#797979'
                                contact = c.contact
                                title = u'您的预约\n' + title
                                deletable = 'true'
                                name = u"您"
                            elif current_user.is_authenticated and current_user.permissions == 0:
                                contact = c.contact
                                if c.start_time > now:
                                    deletable = 'true'

                            conference_jsons.append({'id': c.id, 'title': title, 'start': str(c.start_time),
                                                     'end': str(c.end_time), 'backgroundColor': background_color,
                                                     'borderColor': border_color, 'textColor': text_color,
                                                     'className': 'fullcalendar-event-cursor-pointer',
                                                     'introduction': c.introduction, 'status': status, 'contact': contact,
                                                     'name': name, 'deletable': deletable})

                    return jsonify(status='success', conference=conference_jsons)
                elif op == 'delete conference':
                    conference_id = request.form.get('conference_id', None)
                    if conference_id:
                        if current_user.is_authenticated:
                            if current_user.permissions == 1: # 是用户
                                conference_to_del = Conference.query.filter_by(id=conference_id, user_id=current_user.id).first()
                                if conference_to_del:
                                    db.session.delete(conference_to_del)
                                    db.session.commit()
                                    return jsonify(status='success')
                                else:
                                    return jsonify(status='not your conference')
                            elif current_user.permissions == 0: # 是管理员
                                conference_to_del = Conference.query.filter_by(id=conference_id).first()
                                if conference_to_del:
                                    db.session.delete(conference_to_del)
                                    db.session.commit()
                                    return jsonify(status='success')
                                else:
                                    return jsonify(status='no this conference')

                    else:
                        return jsonify(status='arguments error')
                elif op == 'add conference':
                    name = request.form.get('name', None)
                    contact = request.form.get('contact', None)
                    introduction = request.form.get('introduction', None)
                    start_time = request.form.get('start_time', None)
                    end_time = request.form.get('end_time', None)

                    if name and contact and start_time and end_time:
                        try:
                            start_time = datetime.strptime(start_time, '%Y-%m-%d %H:%M')
                            end_time = datetime.strptime(end_time, '%Y-%m-%d %H:%M')
                        except ValueError:
                            return jsonify(status='arguments error')
                        if not contact.isalnum():
                            return jsonify(status='arguments error')
                        if not start_time < end_time:
                            return jsonify(status='arguments error')

                        conference_to_add = Conference(user_id=current_user.id, name=name, contact=contact,
                                                       introduction=introduction,
                                                       start_time=start_time,
                                                       end_time=end_time)
                        db.session.add(conference_to_add)
                        db.session.commit()
                        return jsonify(status='success')
                    else:
                        return jsonify(status='arguments error')
            else:
                return jsonify(status='arguments error')
        else:
            return jsonify(status='need login')
