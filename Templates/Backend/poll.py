from flask import Flask, jsonify, render_template, request, redirect, url_for
from database import Database, DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER

db = Database(DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT)
db.connect()

class PollApp:
    def __init__(self, database):
        self.database = database

    def create_poll(self, organizationid, polltitle, polldescription, questions):
        poll_query = """
            INSERT INTO polls (organizationid, polltitle, polldescription) 
            VALUES (%s, %s, %s) RETURNING pollid;
        """
        result = self.database.execute_query(poll_query, (organizationid, polltitle, polldescription))
        
        if result:
            poll_id = result[0]
            
            # Loop over each question and insert it into the database
            for question in questions:
                question_text = question['question_text']
                choices = question['choices']
                question_id = self.create_question(poll_id, question_text)
                
                if question_id:
                    # Loop over each choice for the question and insert it into the database
                    for choice in choices:
                        choice_text = choice['choice_text']
                        self.create_choice(question_id, choice_text)
                else:
                    # Handle error if unable to create question
                    return None
            
            return poll_id
        else:
            return None
    
    def get_polls(self):
        poll_query = "SELECT pollid, organizationid, polltitle, polldescription, choices FROM polls;"
        polls = self.database.execute_query(poll_query)
        return polls
    
    def get_poll_by_id(self, poll_id):
        poll_query = "SELECT pollid, organizationid, pollstartdate, pollenddate, polltitle, polldescription, choices FROM polls WHERE pollid = %s;"
        poll = self.database.execute_query(poll_query, (poll_id,))
        
        if not poll:
            return None
        
        return poll[0]
    
    def get_poll_by_id(self, poll_id):
        poll_query = """
            SELECT pollid, organizationid, polltitle, polldescription, choices 
            FROM polls WHERE pollid = %s;
        """
        poll = self.database.execute_query(poll_query, (poll_id,))
        return poll[0] if poll else None

    def vote_in_poll(self, poll_id, choice):
        # Assuming there's a separate table for votes, let's call it poll_votes
        vote_query = "INSERT INTO poll_votes (pollid, choice) VALUES (%s, %s);"
        self.database.execute_query(vote_query, (poll_id, choice))
        return True  # Assuming success, should handle error cases too

    def get_poll_results(self, poll_id):
        results_query = """
            SELECT choice, COUNT(*) AS vote_count
            FROM poll_votes WHERE pollid = %s
            GROUP BY choice;
        """
        results = self.database.execute_query(results_query, (poll_id,))
        return results

def init_poll_routes(app, db):
    poll_app = PollApp(db)


    @app.route('/create_poll', methods=['POST'])
    def create_poll():
        # Ensure the received content type is application/json
        if not request.is_json:
            return jsonify({"error": "Request body must be JSON"}), 400
            
        data = request.get_json()
        organizationid = data.get('organizationid')
        polltitle = data.get('polltitle')
        polldescription = data.get('polldescription')
        questions = data.get('questions', []) 
        
        # Input validation (simple example)
        # if not all([organizationid, startdate, enddate, polltitle, polldescription]) or not choices:
        #     return jsonify({"error": "Missing required fields"}), 400
        try:
            poll_id = poll_app.create_poll(
                organizationid,  
                polltitle, 
                polldescription, 
                questions
            )
            return jsonify({"poll_id": poll_id}), 201
        except Exception as e:
            # Log the error e or handle it as appropriately
            return jsonify({"error": "Failed to create the poll"}), 500

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

    # Route for voting in a poll
    @app.route('/polls/<int:poll_id>/vote', methods=['POST'])
    def vote_in_poll(poll_id):
        data = request.json
        choice = data['choice']
        success = poll_app.vote_in_poll(poll_id, choice)
        return jsonify({"success": success})

    # Route for getting poll results
    @app.route('/polls/<int:poll_id>/results', methods=['GET'])
    def get_poll_results(poll_id):
        results = poll_app.get_poll_results(poll_id)
        return jsonify(results)