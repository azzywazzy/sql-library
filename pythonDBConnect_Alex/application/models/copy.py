from application import db


# ORM - Object relational mapping - mapping class to a table
# DTO - data transfer object
class Copy(db.Model):
    item_barcode = db.Column(db.String(8), nullable=False, primary_key=True)
    isbn = db.Column(db.String(13), db.ForeignKey('item.isbn'), nullable=True)
    branch_id = db.Column(db.Integer, db.ForeignKey('location_id.branch_id'), nullable=True)
    c_loan = db.relationship('Loan', backref='c_loan')
