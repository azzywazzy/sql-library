from application import db


# ORM - Object relational mapping - mapping class to a table
# DTO - data transfer object
class Loan(db.Model):
    loan_number = db.Column(db.Integer, nullable=False, primary_key=True)
    loan_date = db.Column(db.Date, nullable=True)
    card_number = db.Column(db.String(8), db.ForeignKey('members.card_number'), nullable=True)
    item_barcode = db.Column(db.String(8), db.ForeignKey('copy.item_barcode'), nullable=False)
    branch_id = db.Column(db.Integer, db.ForeignKey('location_id.branch_id'), nullable=True)
    due_date = db.Column(db.Date, nullable=True)
    returned_date = db.Column(db.Date, nullable=True)
