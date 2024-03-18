from flask import Flask
from Templates.login import LoginApp
from database import Database, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER
# Create a Flask application instance
app = Flask(__name__)
login_app = LoginApp()

# Instantiate Database object
db = Database(DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT)

# Run the Flask application
if __name__ == '__main__':
    app.run(debug=True)
