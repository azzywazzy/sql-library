from application import db


# ORM - Object relational mapping - mapping class to a table
# DTO - data transfer object
class LocationId(db.Model):
    branch_id = db.Column(db.Integer, nullable=False, primary_key=True)
    branch_name = db.Column(db.String(50), nullable=False)
    address_1 = db.Column(db.String(50), nullable=True)
    address_2 = db.Column(db.String(50), nullable=True)
    postcode = db.Column(db.String(8), nullable=True)
    phone_number = db.Column(db.String(20), nullable=True)
    l_copy = db.relationship('Copy', backref='l_copy')
    l_loan = db.relationship('Loan', backref='l_loan')
