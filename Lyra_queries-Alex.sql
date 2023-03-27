use library;
-- permitted
select a.author_first, a.author_last, i.title, i.description, i.isbn, i.is_available from author a join book_author b on a.author_id = b.author_id join item i on b.isbn = i.isbn where a.author_last = "Pullman";
select i.title, c.item_barcode, l.branch_name from item i join copy c on i.isbn = c.isbn join location_id l on c.branch_id = l.branch_id where i.title = 'Northern lights';
select title, author_first, author_last, loan_date, due_date, returned_date from loan l join copy c on l.item_barcode = c. item_barcode join item i on c.isbn = i.isbn join book_author b on i.isbn = b.isbn join author a on b.author_id = a.author_id where card_number = 10000003;
-- not permitted
select * from members where card_number = 10000001;
insert into loan (loan_date, card_number, item_barcode, branch_id, due_date) values ('2023-03-26', 10000003, 20000006, 2, '2023-04-16');
