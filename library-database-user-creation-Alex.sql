drop user 'lyra.silvertongue'@'localhost';

-- creating user for library members, allowed to view all tables except members (privacy), no editing
create user 'library.member'@'localhost' identified by 'member.pass';

grant select on library.* to 'library.member'@'localhost';
revoke select on library.members from 'library.member'@'localhost';

-- creating user for library administrative assistant
-- allowed to view all tables, insert loans (to check out books), update returned date on loans
-- allowed to update member details all fields except card number and creation date
create user 'library.admin'@'localhost' identified by 'libadminpass';

grant select on library.* to 'library.admin'@'localhost';
grant update 
(first_name, last_name, dob, is_over_18, address_1, address_2, postcode, phone_number, email, renewal_date, account_status) 
on library.members to 'library.admin'@'localhost';
grant insert on library.loan to 'library.admin'@'localhost';
grant update (returned_date) on library.loan to 'library.admin'@'localhost';

-- creating user for librarian
-- view, update all tables
-- insert all tables except location_id
-- delete all tables except location_id, loan (Do we want anyone to be able to delete loans?)
create user 'librarian'@'localhost' identified by 'librarian.pass';

grant select, update, insert, delete on library.* to 'librarian'@'localhost';
revoke insert, delete on library.location_id from 'librarian'@'localhost';
revoke delete on library.loan from 'librarian'@'localhost';

