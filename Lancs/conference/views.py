from . import conference
from flask import render_template, request, jsonify


@conference.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'GET':
        return render_template('conference/index.html')


@conference.route('/source/', methods=['GET', 'POST'])
def source():
    if request.method == 'GET':
        temp = [{"title": "hehe3", "start": "2017-03-02 15:25:00", "end": "2017-03-02 17:15:00"},
                {"title": "hehe1", "start": "2017-03-01 12:00:00", "end": "2017-03-01 14:00:00"},
                {"title": "hehe2", "start": "2017-03-02 13:00:00", "end": "2017-03-02 14:15:00"},
                {"title": "hehe4", "start": "2017-03-02 14:15:00", "end": "2017-03-02 14:35:00"},
                {"title": "hehe5 ", "start": "2017-03-02 14:45:00", "end": "2017-03-02 15:25:00"},
                {"title": "hehe6 ", "start": "2017-03-03 14:15:00", "end": "2017-03-03 15:25:00"},
                {"title": "hehe7 ", "start": "2017-03-04 15:45:00", "end": "2017-03-04 16:45:00"},
                {"title": "hehe8 ", "start": "2017-03-05 08:30:00", "end": "2017-03-05 15:25:00"},
                {"title": "hehe9 ", "start": "2017-03-06 14:45:00", "end": "2017-03-06 15:55:00"},
                {"title": "hehe10 ", "start": "2017-03-07 17:45:00", "end": "2017-03-07 19:25:00"},]
        return jsonify(temp)
