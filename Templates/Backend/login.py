from flask import Flask, render_template, request, redirect, url_for
from database import Database, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER

db = Database(DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT)
db.connect()
class LoginApp():
    def __init__(self, database):
        self.database = database

    def login(self, username, password):
        query = "SELECT username, password FROM users WHERE username = %s;"
        result = self.database.execute_query(query, (username,))
        
        if result:
            user_username, user_password = result[0]
            if user_password == password:
                return True
        
        return False

# Define a function to register login routes
def init_login_routes(app):
    login_backend = LoginApp(db)

    @app.route('/')
    def index():
        return render_template('login.html')

    @app.route('/login', methods=['POST'])
    def login():
        username = request.form['username']
        password = request.form['password']

        if login_backend.login(username, password):
            return redirect(url_for('success'))
        else:
            return render_template('login.html', error='Invalid username or password')

    @app.route('/success')
    def success():
        return 'Login Successful!'