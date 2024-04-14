from flask import Flask, request, jsonify
from firebase_admin import messaging
from app import app

@app.route('/send_notification', methods=['POST'])
def send_notification():
    registration_token = request.json['token']
    message = messaging.Message(
        notification=messaging.Notification(
            title='Title',
            body='Body'
        ),
        token=registration_token
    )
    messaging.send(message)
    return 'Notification sent', 200