import streamlit as st
import plotly.express as px
import mysql.connector
import pandas as pd 

# Create a Streamlit app
st.title("Phonepe Data Visualization Dashboard")
st.write("Explore data interactively using Streamlit and Plotly.")

# Dropdown to select data source
data_source = st.selectbox("Select Data Source:", ["state_metrics", "aggregated_data"])

# Establish a MySQL connection
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="white",
    database="pulse"
)

# Create a cursor
cursor = db.cursor()

# Fetch data based on the selected data source
if data_source == "state_metrics":
    cursor.execute("SELECT entityName, count FROM state_metrics")
elif data_source == "aggregated_data":
    cursor.execute("SELECT name, type, count FROM aggregated_data")

data = cursor.fetchall()
cursor.close()
db.close()

# Process and display data
if data:
    if data_source == "state_metrics":
        entityNames, counts = zip(*data)

        fig = px.bar(
            data_frame={'entityName': entityNames, 'count': counts},
            x='entityName',
            y='count',
            title=f"Counts for All Entities"
        )
    elif data_source == "aggregated_data":
        df = pd.DataFrame(data, columns=['name', 'type', 'count'])
        fig = px.bar(df, x='name', y='count', color='type', barmode='group', title="Aggregated Data")

    st.plotly_chart(fig)
else:
    st.write(f"No data available for the selected data source.")
