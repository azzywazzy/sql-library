from application import db

from application.models.author import Author
from application.models.book_author import BookAuthor
from application.models.copy import Copy
from application.models.item import Item
from application.models.loan import Loan
from application.models.location_id import LocationId
from application.models.members import Members

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy import select, delete, update
from datetime import date, datetime, timedelta

user = 'library.python'
password = 'libpython'
host = '127.0.0.1'
port = 3306
database = 'library'


# PYTHON FUNCTION TO CONNECT TO THE MYSQL DATABASE AND
# RETURN THE SQLACHEMY ENGINE OBJECT
def get_connection():
    return create_engine(
        url="mysql+pymysql://{0}:{1}@{2}:{3}/{4}".format(
            user, password, host, port, database))


engine = get_connection()
Session = sessionmaker(bind=engine)

session = Session()

# search for book by title, return title and author(s)
# input_title = input("Enter title: ")
# book = session.query(Item).filter_by(title=input_title).first()
# print(f'Title: {book.title} ISBN: {book.isbn}')
# for e in book.book_author:
#     author = session.query(Author).filter_by(author_id=e.author_id).first()
#     print("Author:", author.author_first, author.author_last)
# print(f'Available? {book.is_available} \nDescription:\n {book.description}')

# search for book by author, return title(s)
# input_author = input("Enter author's last name: ")
# author = session.query(Author).filter_by(author_last=input_author).all()
# for x in author:
#     for e in x.author_book:
#         book = session.query(Item).filter_by(isbn=e.isbn).all()
#         for i in book:
#             print(f'Title: {i.title} ISBN: {i.isbn}')
#             print("Author:", x.author_first, x.author_last)
#             print(f'Available? {i.is_available} \nDescription:\n {i.description}')

# search on title, see locations
# input_title = input("Enter title: ")
# book = session.query(Item).filter_by(title=input_title).first()
# print(f'Title: {book.title} ISBN: {book.isbn}')
# for e in book.book_author:
#     author = session.query(Author).filter_by(author_id=e.author_id).first()
#     print("Author:", author.author_first, author.author_last)
# barcode = session.query(Copy).filter_by(isbn=book.isbn).all()
# for x in barcode:
#     location = session.query(LocationId).filter_by(branch_id=x.branch_id).first()
#     print('Barcode: {:10s} Branch: {:40s} Postcode: {:10s}'.format(x.item_barcode, location.branch_name, location.postcode))

# see all books at a given location (barcode, isbn, branch)
# stmt = (select(LocationId).join(LocationId.l_copy).where(LocationId.branch_name == "Central Library"))
# result = session.execute(stmt)
# for e in result.scalars():
#     print(f'{e.item_barcode} {e.isbn} {e.branch_name} {e.address_1} {e.address_2}')

# see all books (title and author) that are at a given location
# copies = session.query(LocationId).filter_by(branch_id="4").first()
# print("Branch: {:25s} Location: {:25s}".format(copies.branch_name, copies.address_1))
# for e in copies.l_copy:
#     title = session.query(Item).filter_by(isbn=e.isbn).first()
#     print(title.title, end="  ")
#     for i in title.book_author:
#         author = session.query(Author).filter_by(author_id=i.author_id).first()
#         print(f'Author: {author.author_first} {author.author_last}')


# # SELECT members by last name
# input_lname = input("Enter member's last name: ")
# members = session.query(Members).filter_by(last_name=input_lname).all()
# for e in members:
#     print("Name: {:10s} {:15s}".format(e.first_name, e.last_name))
#     print("Address: {:20s} {:10s} {:10s}".format(e.address_1, e.address_2, e.postcode))
#     print("Phone: {:20s} Email: {}".format(e.phone_number, e.email))
#     print("DOB: {} Over 18? {}".format(e.dob, e.is_over_18))
#     print("Renewal Date: {} Status: {:10s}".format(e.renewal_date, e.account_status))

# # add a new member
# new_member = Members(card_number="10000011", first_name="Josie", last_name="Rones", dob="1990-11-01", is_over_18=True,
#                      address_1="Gallery Walk", address_2="Wakefield", postcode="WF1 5AW", phone_number="07484 088399",
#                      email="josie.rones@gmail.com", creation_date="2023-04-02", renewal_date="2026-04-02",
#                      account_status="Active")
# session.add(new_member)
# session.commit()

# update member details
update_stmt = update(Members).where(Members.card_number == "10000002").values(last_name="Cowburn")
session.execute(update_stmt)
session.commit()
# add a new copy of an existing book
# new_book = Copy(item_barcode="20000017", isbn="9781398510562", branch_id=4)
# session.add(new_book)
# session.commit()

# add brand new title (with an existing author)
# new_title = Item(isbn="9781804180013", title="Infamous", description="""Young aspiring writer Edit 'Eddie' Miller
# and her best friend Rose have always done everything together - climbing trees, throwing grapes at boys, sneaking bottles
# of wine, practising kissing...\n Now that they're out in society, Rose is suddenly talking about marriage,
# and Eddie is horrified.""")
# session.add(new_title)
# new_book_author_link = BookAuthor(book_author_id=11, isbn="9781804180013", author_id=5)
# session.add(new_book_author_link)
# new_book = Copy(item_barcode="20000018", isbn="9781804180013", branch_id=4)
# session.add(new_book)
# session.commit()

# delete a copy
# to_delete = session.query(Copy).filter_by(item_barcode="20000003").first()
# session.delete(to_delete)
# session.commit()

# this method works with > < and with date.today()
# SELECT from members where renewal date has passed
# member_stmt = select(Members).where(Members.renewal_date < date.today())
# member_result = session.execute(member_stmt)
# for e in member_result.scalars():
#     print(f'{e.first_name} {e.last_name} {e.renewal_date}')
#     print(f'{e.phone_number} {e.email}')



# this is a different way, need to import the select function from sqlalchemy
# SELECT from members by address (can sub any column)
# member_stmt = select(Members).where(Members.address_2 == "Leeds")
# member_result = session.execute(member_stmt)
# for e in member_result.scalars():
#     print(f'{e.first_name} {e.last_name} {e.address_1} {e.address_2}')

# does the same as above using session.query().filter_by()
# member_query = session.query(Members).filter_by(is_over_18=False).all()
# for e in member_query:
#     # to print a date, use empty {} or {:}, if you type a number in there is prints that number instead of the date
#     # something wrong with the boolean is_over_18, all are returning True
#     # it does filter true vs false correctly, but displays the word True either way...
#     print("{:15s} {:15s} {:20s} {:20s} {} {}".format(e.first_name, e.last_name, e.address_1, e.address_2, e.dob, e.is_over_18))
#     # print(f'{e.first_name} {e.last_name} {e.address_1} {e.address_2} {e.account_status}')
# # member_query is a list of objects, each identified by their class and primary key
# # # print(member_query)
#
# # can get this to work with date = some specific date, but not with > <
# member_query = session.query(Members).filter_by(renewal_date="2026-03-24").all()
# for e in member_query:
#     print("{:15s} {:15s} {}".format(e.first_name, e.last_name, e.renewal_date))

# member_query = session.query(Members).filter_by(card_number="10000005").first()
# print(member_query.renewal_date - date.today())

# # SELECT book_author by book_author_id
# book_author = session.query(BookAuthor).filter_by(book_author_id='1').first()
# print(book_author.book_author_id, book_author.isbn)
