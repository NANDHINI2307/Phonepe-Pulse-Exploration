import json
import mysql.connector

# Read the JSON data from the file
file_path = "/Users/miosalon/logu/pulse/data/top/transaction/country/india/2023/1.json"

with open(file_path, 'r') as file:
    data = json.load(file)

# Extract data from the JSON
states_data = data['data']['states']

# Initialize variables to store the total count and amount
total_count = 0
total_amount = 0.0

# Iterate through the states data and calculate the total count and amount
for state in states_data:
    total_count += state['metric']['count']
    total_amount += state['metric']['amount']

# Print the total count and amount
print("Total Count:", total_count)
print("Total Amount:", total_amount)

# Connect to the MySQL database
db = mysql.connector.connect(
    host="localhost",  # Your MySQL host
    user="root",  # Your MySQL username
    password="white",  # Your MySQL password
    database="pulse"  # Your MySQL database name
)

# Create a MySQL cursor
cursor = db.cursor()

# Insert data into the MySQL table
for state in states_data:
    entityName = state['entityName']
    count = state['metric']['count']
    amount = state['metric']['amount']

    insert_query = "INSERT INTO state_metrics (entityName, count, amount) VALUES (%s, %s, %s)"
    values = (entityName, count, amount)

    cursor.execute(insert_query, values)

# Commit changes and close the database connection
db.commit()
db.close()
