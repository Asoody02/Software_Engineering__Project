from flask import Flask, jsonify, render_template, request, redirect, url_for
from app import app, Database, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER
from flask import session, jsonify
from flask import Flask, request, jsonify



MIN_LEN_USERNAME = 5
MIN_LEN_PASSWORD = 6
db = Database(DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT)
db.connect()

class User:
    @staticmethod
    def change_password(username, new_password):
        global db  
        try:
          
            query = "UPDATE users SET password = %s WHERE username = %s;"
            db.execute_query(query, (new_password, username))  # db.execute_query 메서드 사용
            return True
        except Exception as e:
            print(f"Error updating password: {e}")
            return False
        
    @app.route('/changepwd', methods=['GET', 'POST'])
    def changepwd():
    
        username = session.get('username')
        if not username:
        
            return redirect(url_for('login'))

        if request.method == 'POST':
            newpwd = request.form.get('newpwd')
            pwdconfirm = request.form.get('pwdconfirm')

            if not newpwd or len(newpwd) < MIN_LEN_PASSWORD:
                message = "Password must be at least {} characters long.".format(MIN_LEN_PASSWORD)
            elif newpwd != pwdconfirm:
                message = "Passwords do not match."
            else:
                if User.change_password(username, newpwd):
                    message = 'Password changed successfully.'
                else:
                    message = 'Error changing password.'

            return render_template('changepwd.html', message=message)

        
        return render_template('changepwd.html')
