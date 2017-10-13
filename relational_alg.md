
// Relational Algebraic Expressions

8) List the average price of all copies of books available at ‘Henry Downtown’ branch.
9) For every book that is possessed by Henry Books, output the book code, the number of total copies available
collectively at all its branches, and the average price of a copy of that book.
10) For every publisher, list the name of the publisher, number of books it has published, and the average base pric (Book relation contains the base price of a book) of those books.

Q8)
hDbook ← branchName = ‘Henry Downtown’ (branch); 
hDbook2 ← ρ (branchNum2)(hDbook);
￼bookNbranch ←  hBbook2 ⨝ (branchNum2 = branchNum) inventory;
bookNbranch2 ← ρ (bookCode2) (bookNbranch);
allInfo ←  bookNbranch2 ⨝ (bookCode2= bookCode) book;
resQ8 ← (bookCode) grouping symbol (avg price) allinfo;

Q9)
resQ9 ← (bookCode) grouping symbol (count bookCode)(avg price) copy;

Q10)
publi2 ← ρ (pubCode2)(publisher);
pNbInfo ← publi2 ⨝ (pubCode2 = publisherCode) book;
resQ10 ←(publisherName) grouping symbol (count bookCode) (avg price) pNbInfo;
