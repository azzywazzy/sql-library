use Library;

create table author(
	author_id smallint not null unique primary key,
    author_first varchar(50) not null,
    author_last varchar(50) not null
    );
    
    
insert into author values(00001, 'Philip', 'Pullman');

select * from author;