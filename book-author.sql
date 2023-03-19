use Library;

create table book_author(
	isbn char(13),
    author_id smallint,
    primary key (isbn),
    constraint fk_isbn_item foreign key (isbn) references item (isbn),
    constraint fk_authorid_author foreign key (author_id) references author (author_id)
);

insert into book_author values ('9780440238133', 00001);