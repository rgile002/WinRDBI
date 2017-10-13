
Q1) List the title of each book published by Penguin USA. You are allowed to use only 1 table in any FROM clause

SELECT  title
FROM    book
WHERE   publishercode IN
	(SELECT publishercode
	 FROM publisher
	 WHERE publishername ='Penguin USA')

Q2) List the title of each book that has the type PSY or whose publisher code is JP. You are allowed to use only one condition term in any WHERE clause; i.e., don't use AND/OR boolean operations.

Select  title
from    book
where   type ='PSY' 
union 
     (select  title
      from    book
      where   publishercode ='JP')

Q3) List the title of each book that has the type CMP, HIS, or SCI. You are allowed to use only one condition term in any WHERE clause

select title
from book
where type ='CMP'
union (select title
from book
where type ='HIS')
union (select title
from book
where type ='SCI')

Q4) List the title of each book written by John Steinbeck and that has the type FIC.

select  title 
from    book 
where   bookcode 
        In 
        (select  bookcode
         from    wrote 
         where   authornum 
                 In 
                 (select  authornum
                  from    author 
                  where   authorfirst ='John' 
                          and authorlast='Steinbeck')) 
                          and type= 'FIC'

Q5) For each book, list the title (sorted alphabetically), publisher code, type and author names (in the order listed on the cover).

SELECT title, publishercode, type, authorlast, authorfirst
from author, wrote, book
WHERE author.authornum = wrote.authornum and wrote.bookcode= book.bookcode
order by title, sequence;

Q6) How many book copies have a price that is greater than $20 and less than $25?

select count(bookcode)
from copy
where price> 20 and price <25 ;

Q7) For each publisher, list the publisher name and the number of books published by it, only if the publisher publishes at least 2 books.

select publishername, count(bookcode)
from publisher, book
where publisher.publishercode= book.publishercode 
group by publishername
having count(bookcode)>=2

Q8) For each book copy available at the Henry on the Hill branch whose quality is Excellent, list the book's title (sorted alphabetically) and author names (in the order listed on the cover).

select distinct title, authorlast, authorfirst
from copy, book, author, wrote
where copy.branchnum In 
(select branchnum 
from branch
where branchname ='Henry on the Hill') 
and quality ='Excellent' and
copy.bookcode = book.bookcode and 
copy.bookcode = wrote.bookcode and 
wrote.authornum= author.authornum 
order by title

Q9_a) Create a new table named FictionCopies using the data in the bookCode, title, branchNum, copyNum, quality, and price columns for those books that have the type FIC. You should do this in two steps: 9A) Create the table, and 9B) populate it with the said data.

CREATE TABLE public.fictioncopies
(bookcode character(4) NOT NULL,
  title character(40),
  branchnum numeric(2,0) NOT NULL,
  copynum numeric(2,0) NOT NULL,
  quality character(20),
  price numeric(8,2),
  CONSTRAINT fictioncopies_pkey PRIMARY KEY (bookcode, title,quality,branchnum,copynum, price))

Q9_b)

Insert Into fictioncopies (bookcode, title,
branchnum, copynum, quality, price)
select copy.bookcode, title, branchnum, copynum, quality, price
from copy, book
where type= 'FIC' and copy.bookcode = book.bookcode

Q10) Ray Henry is considering increasing the price of all copies of fiction books whose quality is   Excellent by 10%. To determine the new prices, list the bookCode, title, and increased price of every book in Excellent condition in the FictionCopies table. You are not allowed to modify the prices in the table, just show them.

select distinct bookcode, title, (price*1.1) as newPrice 
from fictioncopies
where quality= 'Excellent'

