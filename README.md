# WinRDBI


Relational Model representation of the Henry Books Database:
Relations and their Attributes are specified below with the identification of the Primary Key at the end of each Relati
a) Author - (authorNum/numeric, authorLast/char, authorFirst/char) PK: authorNum
b) Book - (bookCode/char, title/char, publisherCode/char, type/char, price/numeric, paperback/char) PK: bookCo
c) Branch - (branchNum/numeric, branchName/char, branchLocation/char, numEmployees/numeric) PK: branchN
d) Inventory - (bookCode/char, branchNum/numeric, onHand/numeric) PK: bookCode
e) Publisher - (publisherCode/char, publisherName/char, city/char) PK: publisherCode
f) Wrote - (bookCode/char, authorNum/numeric, sequence/numeric) PK: bookCode,authorNum
Sequence refers to the sequence in which this author appears on the cover – first author, second author, etc.
g) Copy - (bookCode/char, branchNum/numeric, copyNum/numeric, quality/char, price/numeric) PK: bookCode, branchNum, copyNum
