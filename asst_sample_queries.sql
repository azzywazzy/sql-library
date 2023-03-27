use library;
select * from location_id;

-- updating members as permission allows
update members
set last_name = "Deer" where card_number = "10000003";
select * from members;

-- attempt to update location which it shouldn't allow and doesn't
update location_id
set address_2 = "Edinburgh" where branch_id = 1;

-- insert a loan
insert into loan
values(17, '2023-03-27', '10000001', '20000001', 1, '2023-04-17', null);

select * from loan;