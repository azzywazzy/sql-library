create user 'lyra.silvertongue'@'localhost' identified by 'pantalaimon';

grant select on library.author to 'lyra.silvertongue'@'localhost';
grant select on library.book_author to 'lyra.silvertongue'@'localhost';
grant select on library.copy to 'lyra.silvertongue'@'localhost';
grant select on library.item to 'lyra.silvertongue'@'localhost';
grant select on library.loan to 'lyra.silvertongue'@'localhost';
grant select on library.location_id to 'lyra.silvertongue'@'localhost';

create user 'library.admin'@'localhost' identified by 'libadminpass';

grant select on library.* to 'library.admin'@'localhost';
grant update (first_name, last_name, dob, is_over_18, address_1, address_2, postcode, phone_number, email, renewal_date, account_status) on library.members to 'library.admin'@'localhost';
grant insert on library.loan to 'library.admin'@'localhost';
grant update (returned_date) on library.loan to 'library.admin'@'localhost';