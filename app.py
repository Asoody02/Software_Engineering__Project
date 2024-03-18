from flask import Flask
from Templates.Backend.login import LoginApp
from database import Database, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER
# Create a Flask application instance
app = Flask(__name__)
login_app = LoginApp()

# Instantiate Database object
db = Database(DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT)

# Define a route and its associated view function
@app.route('/')
def hello():
    try:
        # Connect to the database
        db.connect()

        # Execute a basic query to test the connection
        rows = db.execute_query('SELECT * FROM users')

        # Close the database connection
        db.close()

        # Check if the query returned a result
        if rows and len(rows) > 0 and rows[0][0] == 1:
            return 'Database connection test successful!'
        else:
            return 'Database connection test failed: no rows returned or unexpected result.'
    except Exception as e:
        # Log any errors that occur during database connection
        return f'Database connection test failed: {str(e)}'


# Run the Flask application
if __name__ == '__main__':
    app.run(debug=True)
