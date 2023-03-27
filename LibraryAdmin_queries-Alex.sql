use library;

-- show members own details
select * from members where card_number = 10000001;

-- change member details
update members set phone_number = '07838 989767' where card_number = 10000001;

-- check out a book (insert on loan table)
insert into loan (loan_date, card_number, item_barcode, branch_id, due_date) values ('2023-03-26', 10000003, 20000006, 2, '2023-04-16');
