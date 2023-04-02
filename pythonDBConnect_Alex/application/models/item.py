from application import db


# ORM - Object relational mapping - mapping class to a table
# DTO - data transfer object
class Item(db.Model):
    isbn = db.Column(db.String(13), nullable=False, primary_key=True)
    title = db.Column(db.String, nullable=False)
    description = db.Column(db.String, nullable=True)
    category_id = db.Column(db.Integer, nullable=True)
    is_available = db.Column(db.Boolean, nullable=True)
    book_author = db.relationship('BookAuthor', backref='book_author')
    i_copy = db.relationship('Copy', backref='i_copy')
