from flask import Flask, request, jsonify
from firebase_admin import messaging
from app import app
import firebase_admin
from firebase_admin import credentials

default_app = firebase_admin.initialize_app()
# Initialize Firebase Admin SDK
cred = credentials.Certificate('C:\Users\joshu\OneDrive\Desktop\New folder\Software_Engineering__Project\Templates\Backend\policyvote-688dc-firebase-adminsdk-k2xtz-4de53d23cd.json')
firebase_admin.initialize_app(cred)

@app.route('/send_notification', methods=['POST'])
def send_notification():
    data = request.get_json()
    if 'token' not in data or 'title' not in data or 'body' not in data:
        return jsonify({'message': 'Missing token, title, or body'}), 400
    
    token = data['token']
    title = data['title']
    body = data['body']

    message = messaging.Message(
        notification=messaging.Notification(title=title, body=body),
        token=token,
    )

    try:
        response = messaging.send(message)
        return jsonify({'message_id': response}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500