-- stored procedures

DELIMITER //
create procedure search()
begin
	select a.author_first, a.author_last, i.title, i.description, i.isbn, i.is_available 
    from author a join book_author b on a.author_id = b.author_id join item i on b.isbn = i.isbn 
    where a.author_last = "Pullman";
end//
DELIMITER ;

call search();