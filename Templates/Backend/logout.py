from flask import Flask, jsonify, render_template, request, redirect, url_for
from app import app
from database import Database, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER
from flask import session, jsonify
from flask import Flask, request, jsonify

@app.route('/logout')
def logout():
    # Check if 'username' is actually in session before popping it to avoid KeyError
        session.clear()
    # Redirect to the login page, not the function name 'login'
        return redirect(url_for('login'))
