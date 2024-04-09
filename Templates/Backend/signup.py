from flask import Flask, render_template, request, redirect, url_for
from database import Database, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER

db = Database(DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT)
db.connect()

class SignupApp:
    def __init__(self, database):
        self.database = database

    def signup(self, username, email, password):
        query = "INSERT INTO users (username, email, password) VALUES (%s, %s, %s);"
        self.database.execute_query(query, (username, email, password))
      
def init_signup_routes(app, db):
    signup_backend = SignupApp(db)

    @app.route('/signup', methods=['GET', 'POST'])
    def signup():
        if request.method == 'POST':
            username = request.form['username']
            email = request.form['email']
            password = request.form['password']

            query = "SELECT username FROM users WHERE username = %s;"
            result = db.execute_query(query, (username,))
            if result:
                return render_template('signup.html', error='Username already exists')

            signup_backend.signup(username, email, password)
            return redirect(url_for('login'))
        
        return render_template('signup.html')
