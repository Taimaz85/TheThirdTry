import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Tamiloos3855",
    database="bitnjoy"
)

mycursor = db.cursor()

mycursor.execute("SELECT * FROM tbl_productparent")

data = mycursor.fetchall()

for row in data:
    print("Connection established to:", row)
    
mycursor.close()
db.close()
