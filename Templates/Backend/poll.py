from flask import Flask, jsonify, render_template, request, redirect, url_for
from database import Database, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER

db = Database(DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT)
db.connect()

class PollApp:
    def __init__(self, database):
        self.database = database

    def create_poll(self, organizationid, startdate, enddate, polltitle, polldescription, choices):
        # Format the choices Python list into a PostgreSQL array string
        choices_array = "{" + ",".join(f'"{choice}"' for choice in choices) + "}"
        
        poll_query = """
            INSERT INTO polls (organizationid, pollstartdate, pollenddate, polltitle, polldescription, choices) 
            VALUES (%s, %s, %s, %s, %s, %s) RETURNING pollid;
        """
        # Notice choices_array is passed instead of choices
        result = self.database.execute_query(poll_query, (organizationid, startdate, enddate, polltitle, polldescription, choices_array))
        
        if result:
            # Assuming fetchone() returns a tuple. [0] gets the first (and only) item.
            poll_id = result[0]
            return poll_id
        else:
            return None
    
    def get_polls(self):
        poll_query = "SELECT pollid, organizationid, pollstartdate, pollenddate, polltitle,polldescription, choices FROM polls;"
        polls = self.database.execute_query(poll_query)
        return polls
    
    def get_poll_by_id(self, poll_id):
        poll_query = "SELECT pollid, organizationid, pollstartdate, pollenddate, polltitle,polldescription, choices FROM polls WHERE pollid = %s;"
        poll = self.database.execute_query(poll_query, (poll_id,))
        
        if not poll:
            return None
        
        return poll[0]

def init_poll_routes(app, db):
    poll_app = PollApp(db)

    @app.route('/create_poll', methods=['POST'])
    def create_poll():
        data = request.json
        organizationid = data['organizationid']
        startdate = data['pollstartdate']
        enddate = data['pollenddate']
        polltitle = data['polltitle']
        polldescription = data['polldescription']
        choices = data['choices']
        
        poll_id = poll_app.create_poll(organizationid, startdate, enddate, polltitle, polldescription, choices)
        return jsonify({"poll_id": poll_id}), 201

    @app.route('/polls', methods=['GET'])
    def get_polls():
        polls = poll_app.get_polls()
        return jsonify(polls)

    @app.route('/polls/<int:poll_id>', methods=['GET'])
    def get_poll_by_id(poll_id):
        poll = poll_app.get_poll_by_id(poll_id)
        if poll:
            return jsonify(poll)
        else:
            return jsonify({"message": "Poll not found"}), 404 