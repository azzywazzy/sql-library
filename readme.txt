Get into Tech Exercise 18 - SQL Library

Want to create a SQL database for a library

Tables:
members
items
copies
transactions
locations

Members:
Description:
	holds account and contact details for library members
Fields:
card_number char(8) not null unique primary key
	library card number/account number, 8 digits, stored as string, required
first_name varchar(50) not null
	member's first name(s), required
last_name varchar(50) not null
	member's surname(s), required
dob date()
	member's date of birth, needed to ensure children do not check out inappropriate materials
address_1 varchar(50)
	first line of member's address
address_2 varchar(50)
	city/town for member's address
postcode varchar(8)
	post code for member's address
phone_number varcher(20) not null
	member's phone number
email varchar(254)
	member's email
creation_date date() not null
	date account created
renewal_date date() not null
	date account renewal is required (x years from creation date, and then x years from previous renewal date)
account_status enum('Active', 'Inactive') not null
	status of the account, inactive is renewal date is in the past




