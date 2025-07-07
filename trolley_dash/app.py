from dash import Dash, dcc, html, Output, Input, callback
from psycopg2 import connect
import os
import pandas as pd
from plotly import express

USER = os.environ['DB_USER']
PASSWORD = os.environ['DB_PASSWORD']
DB_NAME = 'trolley'

def getStillagePositions():
    conn = connect(database=DB_NAME, user=USER, password=PASSWORD)
    curr = conn.cursor()

    curr.execute("SELECT * FROM stillage_status")
    d1 = curr.fetchall()
    statuses = pd.DataFrame(d1)

    curr.execute("SELECT * FROM warehouses")
    d2 = curr.fetchall()
    warehouses = pd.DataFrame(d2)

    return statuses, warehouses

