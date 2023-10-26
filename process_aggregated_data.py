import json
import mysql.connector

# Read JSON data from a file
file_path = "/Users/miosalon/logu/pulse/data/aggregated/transaction/country/india/2023/1.json"

with open(file_path, 'r') as file:
    data = json.load(file)

# Establish a MySQL connection
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="white",
    database="pulse"
)

# Create a cursor
cursor = db.cursor()

# Insert data into the MySQL table
for entry in data['data']['transactionData']:
    name = entry['name']
    for payment_instrument in entry['paymentInstruments']:
        type = payment_instrument['type']
        count = payment_instrument['count']
        amount = payment_instrument['amount']
        insert_query = "INSERT INTO aggregated_data (name, type, count, amount) VALUES (%s, %s, %s, %s)"
        cursor.execute(insert_query, (name, type, count, amount))

# Commit the changes and close the cursor and MySQL connection
db.commit()
cursor.close()
db.close()
