from flask import Flask, jsonify, render_template
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# MySQL database configuration
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Tamiloos3855",
    database="bitnjoy"
)
    

# Route to serve the HTML page
@app.route('/')
def index():
    return render_template('main.html')

# API route to fetch data from MySQL and return it as JSON
@app.route('/productparent')
def productparent():
    
        # Connect to MySQL
    cursor = db.cursor()
    cursor.execute("SELECT * FROM tbl_productparent")
    result = cursor.fetchall()
    return result
        
        

        # Execute a query to fetch data
        #mycursor.execute("SELECT * FROM tbl_productparent")
        #data = mycursor.fetchall()
        
        #for x in data:
        #    print(x)
        
        # Close the connection
        #mycursor.close()
        #connection.close()
        
        # Return the data as JSON
        #return jsonify(data)


#for row in data:
#    print("Connection established to:", row)
    
if __name__ == '__main__':
    app.run(debug=True)