from flask import Flask, request, jsonify
from firebase_admin import messaging
from app import app

@app.route('/send_notification', methods=['POST'])
def send_notification():
    data = request.get_json()
    if 'title' not in data or 'body' not in data:
        return jsonify({'message': 'Missing token, title, or body'}), 400
    
    title = data['title']
    body = data['body']

    message = messaging.Message(
        notification=messaging.Notification(title=title, body=body),
    )

    try:
        response = messaging.send(message)
        return jsonify({'message_id': response}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500