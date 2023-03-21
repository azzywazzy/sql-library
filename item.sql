use Library;

create table item(
	isbn char(13) not null unique primary key,
    title tinytext not null,
    description text,
    category_id smallint
    );
    
insert into item values('9780440238133', 'His Dark Materials: The Golden Compass (Book 1)',"Lyra is rushing to the cold, far North, where witch clans and armored bears rule. North, where the Gobblers take the children they steall—including her friend Roger. North, where her fearsome uncle Asriel is trying to build a bridge to a parallel world.

Can one small girl make a difference in such great and terrible endeavors? This is Lyra: a savage, a schemer, a liar, and as fierce and true a champion as Roger or Asriel could want.

But what Lyra doesn't know is that to help one of them will be to betray the other...

A masterwork of storytelling and suspense, Philip Pullman's award-winning The Golden Compass is the first in the His Dark Materials series, which continues with The Subtle Knife and The Amber Spyglass.
", 32);

select * from item;

alter table item
add column is_available bit;

update item
set is_available = 1
where isbn = '9780440238133'
