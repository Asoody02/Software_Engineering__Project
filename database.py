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

    def execute_query(self, query, params = None):
        if self.cur:
            try:
                self.cur.execute(query, params)
                return self.cur.fetchall()
            except psycopg2.Error as e:
                print("Error executing query:", e)
                return None
        else:
            print("Database connection is not established.")
            return None

    def close(self):
        if self.cur:
            self.cur.close()
        if self.conn:
            self.conn.close()
    # Database configuration
DB_NAME = 'postgres'
DB_USER = 'postgres'
DB_PASSWORD = 'link18266'
DB_HOST = 'localhost'
DB_PORT = '5433'


