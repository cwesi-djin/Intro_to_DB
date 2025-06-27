import mysql.connector
from mysql.connector import errorcode

# connection details
try:
    # Connect to MySQL server
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root"
    )

    pointer = mydb.cursor()

    # Creates database
    pointer.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

    print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    print("Error: Could not connect to MySQL server.")
    print("Details:", err)

finally:
    try:
        if pointer:
            pointer.close()
        if mydb:
            mydb.close()
    except NameError:
        pass