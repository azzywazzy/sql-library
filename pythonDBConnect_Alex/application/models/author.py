from application import db


# ORM - Object relational mapping - mapping class to a table
# DTO - data transfer object
class Author(db.Model):
    author_id = db.Column(db.Integer, nullable=False, primary_key=True)
    author_first = db.Column(db.String(50), nullable=False)
    author_last = db.Column(db.String(50), nullable=False)
    author_book = db.relationship('BookAuthor', backref='author_book')
