from application import db
# from sqlalchemy import Table, Column, Integer, String, ForeignKey


# ORM - Object relational mapping - mapping class to a table
# DTO - data transfer object
class BookAuthor(db.Model):
    book_author_id = db.Column(db.Integer, nullable=False, primary_key=True)
    isbn = db.Column(db.String(13), db.ForeignKey('item.isbn'), nullable=True)
    author_id = db.Column(db.Integer, db.ForeignKey('author.author_id'), nullable=True)

# BookAuthor = Table('BookAuthor',
#     Column('book_author_id', Integer, primary_key=True),
#     Column('isbn', String(13), ForeignKey('Item.isbn')),
#     Column('author_id', Integer, ForeignKey('Author.author_id')))
