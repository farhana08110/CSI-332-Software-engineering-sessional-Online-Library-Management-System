create database DBMS_project;

use DBMS_project;

create table Book_Borrower(
Borrower_id varchar(200),
Borrower_fname varchar(200),
Borrower_lname varchar(200),
Borrower_email varchar(200),
Borrower_phone_number int,
primary key(Borrower_id));


create table books(
book_id varchar(200),
book_title varchar(200),
author_name varchar(200),
book_status varchar(200),
copies int,
Borrower_id varchar(200),
return_date varchar(200),
primary key(book_id),
foreign key(Borrower_id) references Book_Borrower(Borrower_id));

create table borrower_login(
Borrower_id varchar(200),
borrower_password varchar(200),
primary key(borrower_password),
foreign key(Borrower_id) references Book_Borrower(Borrower_id));

create table libraryauthority(
authority_id varchar(200),
authority_name varchar(200),
authority_email varchar(200),
book_id varchar(200),
primary key(authority_id),
foreign key(book_id) references books(book_id));

select * from Book_Borrower;

select * from books;

select * from borrower_login;

select * from libraryauthority;

select COUNT(Borrower_id) as total_borrower
from Book_Borrower;

/*for book_borrower login*/
select Borrower_fname,Borrower_lname,Borrower_password,Borrower_phone_number,Borrower_email
from Book_Borrower
full JOIN borrower_login
on Book_Borrower.Borrower_id = borrower_login.Borrower_id;

/*search for books*/
select book_status from Book
where book_title = 'Deyal';

/*check return date*/
select return_date,book_title
from books
left outer join Book_Borrower
on books.Borrower_id = Book_Borrower.Borrower_id
where book_Title = 'Gora' ;

/* number of books borrowed by a particular borrower*/
select Borrower_id ,COUNT(Borrower_id) from books
group by Borrower_id ;

/*check if anyone borrow more than two books*/
select COUNT(Borrower_id) from books
group by Borrower_id 
having COUNT (Borrower_id) > 2;

/*add , update,delete */
update books set book_status = 'available'
where book_title = 'Naree' and author_name ='Humayun ahmed' ;
select book_title, author_name, book_status from books;

insert into books(book_id, book_title,author_name,book_status , copies,Borrower_id,return_date)
values ('nfiction04', 'Quiet' ,'Susan Cain' , 'available', 3,NULL,NULL);
select * from books where book_id ='nfiction04';

alter table books
add issue_date varchar(200);
select *from books;

delete from books where book_id ='nfiction01';
select*from books;


select Borrower_fname,book_title
from Book_Borrower
join books
on Book_Borrower.Borrower_id = books.Borrower_id
join libraryauthority
on books.book_id=libraryauthority.book_id
where authority_name='Rahman';

(select Borrower_id,Borrower_fname
from Book_Borrower)
except
(select Borrower_id,Borrower_fname
from Book_Borrower
where Borrower_fname='farhana');

select DATEADD (HOUR , 15,'05/06/2022')
from books where book_id = 'fiction01';

select book_title,copies
from books
where copies>(select copies from books where book_title ='Deyal');

select Borrower_lname,Borrower_email
from Book_Borrower
where Borrower_fname='Subrite' and Borrower_id = 'Subrite112';

select authority_name
from libraryauthority
where authority_name like 'a____%';

select copies, book_title
from books
where copies between 3 and 8;

select copies , book_title from books order by copies ASC;













