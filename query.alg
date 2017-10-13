

%Rolf Kinder Gilet,  

%Q1 For every Artistic book (type is ‘ART’), list the book code, book title, its price, and the name of the author along with the author sequence.
artBook := select type = 'ART' (book);
autNum := wrote njoin artBook;
auth := autNum njoin author;
q1result := project bookCode, title, price, authorLast, authorFirst, sequence (auth);

%Q2 Retrieve the names of authors who have written at least one Fiction Book (type is ‘FIC’).
ficBook := select type = 'FIC' (book);
ficAuthNum := wrote njoin ficBook;
authres := ficAuthNum njoin author;
q2result := project  authorFirst, authorLast (authres);

%Q3 Retrieve the names of all authors who have written books published by ‘Jove Publications’.
pbCode := select publisherName = 'Jove Publications' (publisher);
pbBook := pbCode njoin book; 
pbAuth := pbBook njoin wrote; 
authRe := pbAuth njoin author;
q3result := project authorFirst, authorLast (authRe);

%Q4 Retrieve the names of authors who have not written any book in the possession of Henry Books.
aNu := project  authorNum (author);
wNu := project  authorNum (wrote);
notPosHenryBook := aNu  difference wNu; 
auName := notPosHenryBook njoin author;
q4Result := project authorFirst, authorLast (auName);

%Q5 For every book of ’Good’ quality that the Henry Books possesses at its collection of branches, list the book title
% the branch name that carries it, and the name of the author (along with the sequence number) who wrote it.
goodQ := select quality ='Good' (copy);
branchBook :=  branch njoin book;
tempR := project bookCode, title, branchName (branchBook);
bookAuth := goodQ njoin wrote;
authName := bookAuth njoin author;
tempR2 := project bookCode, authorFirst, authorLast, sequence (authName);
ress := tempR njoin tempR2;
q5Result := project  title, branchName,  authorFirst, authorLast, sequence (ress);

%Q6 Retrieve the names of authors who have written at least two books.
% my idea was to project authorNum from wrote and project authorNum from 
% author and do an intersection but the project delet theduplicates i need for the evaluation
allAuthWrote := author njoin   wrote;
au1b := select authorNum =1 (wrote);
au1bSel := select bookCode ='138X' (wrote);
au2b := select authorNum =2 (wrote);
au3b := select authorNum =3 (wrote);
au4b := select authorNum =4 (wrote);
au4bSel := select bookCode ='079X' (wrote);
au5b := select authorNum =5 (wrote);
au5bSel := select bookCode ='0189' (wrote);
au6b := select authorNum =6 (wrote);
au6bSel := select bookCode ='1351' (wrote);
au7b := select authorNum =7 (wrote);
au8b := select authorNum =8 (wrote);
au9b := select authorNum =9 (wrote);
au10b := select authorNum =10 (wrote);
au11b := select authorNum =11 (wrote);
au12b := select authorNum =12 (wrote);
au13b := select authorNum =13 (wrote);
au14b := select authorNum =14 (wrote);
au15b := select authorNum =15 (wrote);
au15bSel := select bookCode ='2226' (wrote);
au16b := select authorNum =16 (wrote);
au16bSel := select bookCode ='3743' (wrote);
au17b := select authorNum =17 (wrote);
au18b := select authorNum =18 (wrote);
au18bSel := select bookCode ='0200' (wrote);
au19b := select authorNum =19 (wrote);
au20b := select authorNum =20 (wrote);
au20bSel := select bookCode ='2766' (wrote);
au21b := select authorNum =21 (wrote);
au22b := select authorNum =22 (wrote);
au23b := select authorNum =23 (wrote);
au24b := select authorNum =24 (wrote);
au25b := select authorNum =25 (wrote);
oneTo8 := (((((((au1bSel union au2b) union au3b) union au4bSel) union au5bSel) union au6bSel) union au7b) union au8b);
to16 := (((((((au9b union au10b) union au11b) union au12b) union au13b) union au14b) union au15bSel) union au16bSel);
to25 := ((((((au17b union au18bSel) union au19b) union au20bSel) union au23b) union au24b) union au25b);
allSingleAuW:= (( oneTo8 union to16) union to25 );
moreThan2Book := wrote difference allSingleAuW;
au2aPlusName := moreThan2Book njoin author;
q6Res:= project authorLast,authorFirst (au2aPlusName);


%Q7
exce:= project bookCode, quality (select quality = 'Excellent' (copy));
goo := project bookCode, quality (select  quality = 'Good' (copy));
fai :=   project bookCode, quality (select quality = 'Fair' (copy));
poo :=  project bookCode, quality (select quality = 'Poor' (copy));
a:=  project bookCode (exce);
b:= project bookCode (goo);
c:=  project bookCode (fai);
d:= project bookCode (poo);
allRes:= ((a intersect b) intersect c) intersect d;
resTitle:= allRes njoin book;
q7Re := project title (resTitle);

