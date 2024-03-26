from flask import Flask
import psycopg2

class Database:
    def __init__(self, dbname, user, password, host, port):
        self.dbname = dbname
        self.user = user
        self.password = password
        self.host = host
        self.port = port
        self.conn = None
        self.cur = None

    def connect(self):
        try:
            self.conn = psycopg2.connect(
                dbname=self.dbname,
                user=self.user,
                password=self.password,
                host=self.host,
                port=self.port
            )
            self.cur = self.conn.cursor()
        except psycopg2.Error as e:
            print("Error connecting to the database:", e)

    def execute_query(self, query, params=None):
        if not self.conn:
            print("Connection not established.")
            return None
        with self.conn.cursor() as cur:
            try:
                cur.execute(query, params)
                result = cur.fetchone()  # Since we're using RETURNING in the INSERT statement
                self.conn.commit()
                print("Query Result:", result)  # Debug: print or log the result to ensure it's fetched correctly
                return result
            except psycopg2.Error as e:
                self.conn.rollback()
                print("Query Execution Error:", e)
                return None

    def close(self):
        if self.cur:
            self.cur.close()
        if self.conn:
            self.conn.close()
    # Database configuration
DB_NAME = 'policyvote'
DB_USER = 'postgres'
DB_PASSWORD = 'SEfall2024'
DB_HOST = 'SE-Spring2024.cn4yqk6gkwp5.us-east-2.rds.amazonaws.com'
DB_PORT = '5432'


