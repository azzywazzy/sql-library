use library;

select * from members;
select * from item;
select * from author;
select * from book_author;
select * from copy;
select * from location_id;
select * from loan;

update members set is_over_18=1;
update members set is_over_18=0 where card_number in (10000004,10000006,10000007);
update book_author set author_id=3 where book_author_id=4;
delete from author where author_id=4;
delete from author;

-- show all books in the database with author last name "Pullman"
select a.author_first, a.author_last, i.title, i.description, i.isbn, i.is_available from author a join book_author b on a.author_id = b.author_id join item i on b.isbn = i.isbn where a.author_last = "Pullman";

-- show all copies of "Northern lights"
select i.title, c.item_barcode, l.branch_name from item i join copy c on i.isbn = c.isbn join location_id l on c.branch_id = l.branch_id where i.title = 'Northern lights';

-- show loan history for member
select title, author_first, author_last, loan_date, due_date, returned_date from loan l join copy c on l.item_barcode = c. item_barcode join item i on c.isbn = i.isbn join book_author b on i.isbn = b.isbn join author a on b.author_id = a.author_id where card_number = 10000003;

-- show members own details
select * from members where card_number = 10000001;

-- change member details
update members set phone_number = '07838 989767' where card_number = 10000001;

-- check out a book (insert on loan table)
insert into loan (loan_date, card_number, item_barcode, branch_id, due_date) values ('2023-03-26', 10000003, 20000006, 2, '2023-04-16');
