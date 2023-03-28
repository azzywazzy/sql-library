use library;

select * from copy where item_barcode = 20000016;

-- create proc to move book copy from one location to another
DELIMITER //
CREATE PROCEDURE Move_Book (in ItemBarcode varchar(50), in Location tinyint)
BEGIN
	UPDATE copy SET branch_id = 4 WHERE item_barcode = 20000016 and branch_id >0;
	SELECT * from copy
END;
DELIMITER;

Call Move_Book (20000016, 5);


-- create proc to view all copies of a book in each location

select i.isbn, i.title, concat(a.author_first, " ", a.author_last), l.branch_name, i.is_available
from item i
inner join copy c
on i.isbn = c.isbn
inner join location_id l
on c.branch_id = l.branch_id
inner join book_author b
on b.blah = i.isbn
inner join author a
on b.author_id = a.author_id
where i.title like '%north%'
;

-- create proc to look for all copies of a book, by searching the title
DELIMITER //
CREATE PROCEDURE Find_Book (in book_title varchar(50))
BEGIN
	select i.isbn, i.title, concat(a.author_first, " ", a.author_last), l.branch_name, i.is_available
	from item i
	inner join copy c
	on i.isbn = c.isbn
	inner join location_id l
	on c.branch_id = l.branch_id
	inner join book_author b
	on b.blah = i.isbn
	inner join author a
	on b.author_id = a.author_id
	where i.title like book_title;
END;
DELIMITER;

call Find_Book('%bio%')