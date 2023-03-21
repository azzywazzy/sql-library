use Library;

create table copy(
	item_barcode char(8) not null unique primary key,
	isbn char(13),
	branch_id tinyint(3),
	foreign key (branch_id) references location_id(branch_id),
	foreign key (isbn) references item(isbn));
    
insert into copy values('12345', '9780440238133', 1);

select * from copy;