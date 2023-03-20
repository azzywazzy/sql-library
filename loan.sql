use Library;

create table loan(
  loan_number mediumint not null auto_increment primary key,
  loan_date date,
  card_number char(8),
  item_barcode char(8),
  branch_id tinyint(3),
  due_date date,
  returned_date date,
  foreign key (card_number) references members(card_number),
  foreign key (item_barcode) references copy(item_barcode),
  foreign key (branch_id) references location_id(branch_id));
  
  insert into loan values (1, '2023-01-01', '10000001', '12345', 1, '2023-01-21', '2023-01-10');
 
 select * from loan;

  