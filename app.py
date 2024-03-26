from flask import Flask
# Import the function to initialize login routes
from Templates.Backend.login import init_login_routes
from Templates.Backend.poll import init_poll_routes
from database import Database, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER
from flask_cors import CORS 
# Create a Flask application instance
app = Flask(__name__)
CORS(app)
# Register login routes with the main Flask app
# Instantiate Database object
db = Database(DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT)
db.connect()

init_login_routes(app)
init_poll_routes(app,db)

# Run the Flask application
if __name__ == '__main__':
    app.run(debug=True)
