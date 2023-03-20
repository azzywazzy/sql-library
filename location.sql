
use Library;

create table location_id(
	branch_id tinyint(3) not null unique primary key,
    branch_name varchar(50) not null,
    address_1 varchar(50),
    address_2 varchar(50),
    postcode varchar(8),
    phone_number varchar(20) not null);
    
insert into location_id values(1, 'York', '5 Main Street','Bishopthorpe', 'YO6 4DJ', '01904 715715');

select * from location_id
 