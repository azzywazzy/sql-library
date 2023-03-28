-- creating customer access
create user "customer1"@"localhost" identified by "customerpass";

-- granting privileges to customer
grant select on library.item to "customer1"@"localhost";
grant select on library.copy to "customer1"@"localhost";
grant select on library.loan to "customer1"@"localhost";
grant select on library.members to "customer1"@"localhost";

-- creating library assistant access
create user 'libr_asst'@'localhost' identified by 'asstpass';

-- granting privileges to assistant
grant select on library.* to 'libr_asst'@'localhost';
grant update on library.members to 'libr_asst'@'localhost';
grant insert on library.loan to 'libr_asst'@'localhost';

select * from loan;

-- creating librarian access
create user 'librarian'@'localhost' identified by 'librarianpass';

-- granting librarian privileges
grant select on library.* to 'librarian'@'localhost';
grant alter on library.* to 'librarian'@'localhost';
grant insert on library.author to 'librarian'@'localhost';
grant insert on library.members to 'librarian'@'localhost';
grant insert on library.loan to 'librarian'@'localhost';
grant insert on library.item to 'librarian'@'localhost';
grant insert on library.copy to 'librarian'@'localhost';

select * from item;

-- query I want to see all books at branch_id 1, Leeds NB specify tables joining TO, not original table
select copy.isbn, item.title 
from item
join copy on item.isbn = copy.isbn
join location_id on copy.branch_id = location_id.branch_id
where location_id.branch_id = 1;

-- query select all loans made by customer id = 10000001
select loan.loan_number, loan.due_date, members.first_name, members.last_name, copy.item_barcode, item.title
from loan
join members on loan.card_number = members.card_number
join copy on loan.item_barcode = copy.item_barcode
join  item on item.isbn = copy.isbn
where members.card_number = "10000001";

-- stored procedures - this works

delimiter $$
create procedure select_members()
begin
select * from members;
end; 
delimiter $$

call select_members

-- how come this works?

delimiter $$
create procedure select_full_name_from_Leeds()
begin
select first_name, last_name from members where address_2 = 'Leeds';
end $$
delimiter ;


call select_full_name_from_leeds;

-- but this doesn't?

delimiter $$
create procedure select_customers_from_Leeds()
begin
select * from members where address_2 = 'Leeds';
end $$
delimiter ;

call select_customers_from_Leeds()

-- when this does?
select * from members where address_2 = "Leeds";

-- stored procedure with parameter

delimiter $$

create procedure select_books_by_author()  -- (in author_last varchar(50))
begin
select title from item
join book_author on book_author.isbn = item.isbn
join author on author.author_id = book_author.author_id
where author_last = 'Pullman';
end $$
delimiter ;

call select_books_by_author()


-- try pass parameter NB NOT WORKING out of time.

delimiter $$

create procedure select_books_choose_author (in author_last varchar(50))
begin
select title from item
join book_author on book_author.isbn = item.isbn
join author on author.author_id = book_author.author_id
where author_last = author_last;
end $$
delimiter ;

call select_books_choose_author('Pullman')
