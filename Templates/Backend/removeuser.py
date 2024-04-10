from flask import Flask, jsonify, render_template, request, redirect, url_for
from database import Database, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER
from app import app
from flask import session, jsonify
from flask import Flask, request, jsonify

db = Database(DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT)
db.connect()


@app.route('/removeusers', methods=['GET', 'POST'])
def remove_users():
    
    if 'is_admin' not in session or not session['is_admin']:
        return "Access denied: You do not have permission to access this page.", 403
    
    
    if request.method == 'POST':
        data = request.get_json()
        user_id = data.get('user_id')
        poll_id = data.get('poll_id')
        
        if user_id and poll_id:
            
            query = "INSERT INTO exclusion (userid, pollid) VALUES (%s, %s)"
            db.execute_query(query, (user_id, poll_id))
            return jsonify({"message": "User excluded from poll successfully."}), 200
        else:
            
            return jsonify({"error": "Missing user_id or poll_id"}), 400
    
    
    polls = db.execute_query("SELECT pollid, polltitle FROM polls")
    users = db.execute_query("SELECT userid, username FROM users")
    return render_template('removeusers.html', polls=polls, users=users)
