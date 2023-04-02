from application import db
from datetime import datetime

# ORM - Object relational mapping - mapping class to a table
# DTO - data transfer object
class Members(db.Model):
    card_number = db.Column(db.String(8), nullable=False, primary_key=True)
    first_name = db.Column(db.String(50), nullable=False)
    last_name = db.Column(db.String(50), nullable=False)
    dob = db.Column(db.Date, nullable=True)
    is_over_18 = db.Column(db.Boolean, nullable=True)
    address_1 = db.Column(db.String(50), nullable=True)
    address_2 = db.Column(db.String(50), nullable=True)
    postcode = db.Column(db.String(8), nullable=True)
    phone_number = db.Column(db.String(20), nullable=True)
    email = db.Column(db.String(254), nullable=True)
    creation_date = db.Column(db.Date, nullable=True)
    renewal_date = db.Column(db.Date, nullable=True)
    account_status = db.Column(db.Enum('Active', 'Inactive'), nullable=True)
    m_loan = db.relationship('Loan', backref='m_loan')
