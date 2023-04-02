# need a few models to connect to a database
# list them in a requirements.txt file, which PyCharm will recognise it and prompt to install

# need to know server location
# need to know database name
# need user and password


from sqlalchemy import create_engine
from sqlalchemy import text

# using root user is not a great idea!!
user = 'library.python'
password = 'libpython'
host = '127.0.0.1'
port = 3306
database = 'library'


# PYTHON FUNCTION TO CONNECT TO THE MYSQL DATABASE AND
# RETURN THE SQLACHEMY ENGINE OBJECT
def get_connection():
    # mysql+pymysql://root:@127.0.0.1:3306/Company
    return create_engine(
        url="mysql+pymysql://{0}:{1}@{2}:{3}/{4}".format(
            user, password, host, port, database))


engine = get_connection()

try:
    with engine.connect() as conn:
        # conn is alias for the connection, use execute method
        # text function from sqlalchemy module allows you to directly enter SQL queries as string
        result = conn.execute(text("SELECT * FROM members"))
        for row in result:
            print(f"First Name: {row.first_name}  Last Name: {row.last_name}")
            # column names have to match database perfectly
except Exception as e:
    print("Exception Happened")
    print(e)

# try:
#     with engine.connect() as conn:
#         # conn is alias for the connection, use execute method
#         # text function from sqlalchemy module allows you to directly enter SQL queries as string
#         result = conn.execute(text("SELECT * FROM loan"))
#         for row in result:
#             print(f"ISBN: {row.isbn}  Due: {row.due_date}")
#             # column names have to match database perfectly
# except Exception as e:
#     print("Exception Happened")
#     print(e)


# # parameterised query
# fName = input("Enter first name: ")
# lName = input("Enter last name: ")
# with engine.connect() as conn:
#     result = conn.execute(text("""SELECT first_name, last_name FROM members WHERE
#     first_name = :fName and last_name = :lName"""), {"fName": fName, "lName": lName})
# for row in result:
#     print(f"First Name: {row.first_name}  Last Name: {row.last_name}")
# triple double quotes allow a long string to span multiple lines

# print('************* join *********')
# author = input("Search by author's last name. Enter last name: ")
# with engine.connect() as conn:
#     result = conn.execute(
#         text("""select a.author_first, a.author_last, i.title, i.is_available from author a join book_author b
#         on a.author_id=b.author_id join item i on b.isbn=i.isbn where a.author_last = :param"""), {"param": author})
#     for row in result:
#         print(f"First Name: {row.author_first} Last Name: {row.author_last} Title: {row.title} Available: {row.is_available}")

# num = input("Card number: ")
# with engine.connect() as conn:
#     result = conn.execute(
#         text("""select i.title, l.due_date from item i join loan l on l.isbn=i.isbn
#         where l.card_number = :param"""), {"param": num})
#     for row in result:
#         print(f"Title: {row.title} Due: {row.due_date}")


# with engine.connect() as conn:
#     result = conn.execute(
#         text("""update members set postcode = 'LS1 1BT' where card_number = 10000010"""))
#     conn.commit()
