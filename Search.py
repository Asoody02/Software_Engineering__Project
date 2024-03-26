from flask import Flask, render_template, redirect, url_for, request
import psycopg2

app = Flask(__name__)

# Function to connect to PostgreSQL database
def connect():
    conn = psycopg2.connect(
        dbname="postgres",
        user="postgres",
        password="link18266",
        host="localhost",
        port="5433"
    )
    return conn
def tabs():
    @app.route('/')
    def home():
        return redirect(url_for('Following'))
    @app.route('/following')
    def Following():
        conn = connect()
        cur = conn.cursor()
        query = request.args.get('query', '')
        if query:
            cur.execute("SELECT organizationname FROM organizations WHERE organizationname ILIKE %s", ('%' + query + '%',))
            results = [clean_result(result) for result in cur.fetchall()]
        else:
            results = []
        conn.close()
        return render_template('following.html', query=query, results=results)
    @app.route('/history')
    def History():
        return render_template('history.html')
    
def clean_result(result):
    return ' '.join(str(item) for item in result)

tabs()
if __name__ == '__main__':
    app.run(debug=True)