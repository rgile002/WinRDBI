
1-4) Exercise 8.16, parts a, c, i, and j of Elmasri/Navathe 7th ed. 

a.) Retrieve the names of all employees in department 5 who work more than 10 hours per week on the ProductX project.

{e.Lname, e.Fname | EMPLOYEE(e) AND  e.Dno = 5 AND
                                     ((∃p) (PROJECT(p) AND  (∃w) WORKS_ON(w) AND
          p.Pname =’ProductX’ AND p.Pnumber= w.pno AND 
          p.Dnum= 5 AND w.Essn= e.ssn AND w.Hours>10 )) }

c.) Find the names of all employees who are directly supervised by‘ Franklin Wong’.

{ e.Lname, e.Fname | EMPLOYEE(e)  AND
           ((∃f) (EMPLOYEE(f) AND 
           f.Fname= ‘Franklin’ AND f.Lname = ‘Wong’ AND 
           e.Super_ssn= f.Ssn)) }

i.) Find the names and addresses of all employees who work on at least one project located in Houston but whose department has no location in Houston.

{ e.Lname, e.Fname, e.Address | EMPLOYEE(e) AND 
((∃p) (Project(p) AND (∃w)(Works_ON(w) AND 
P.Plocation = ‘Houston’ AND e.ssn= w.essn AND  
w.pno = p.Pnumber AND
(NOT(∃d)(DEPT_LOCATIONS(d) AND 
d.dnumber = e.Dno AND d.Dlocation =’Houston’)))}


j.) List the last names of all department managers who have no dependents.

{e.Lname | EMPLOYEE(e) AND (∃d )(DEPARTMENT(d) AND 
e.ssn = d.Mgr_ssn AND
NOT(∃f) (Dependent (f) AND f.Essn = e.Ssn))}

5) Retrieve the names of all employees who work on all projects located in Bellaire.

{ e.Lname, e.Lname | EMPLOYEE(e) AND
((∀p) (Project(p) AND p.Plocation = ‘Bellaire’)) →  ((∃w) (WORKS_ON(w)  AND w.Essn = e.Ssn  AND w.Pno= p.Pnumber ))}

6) Retrieve the names of all employees who have exactly one dependent.

{ e.Fname, e.Lname | EMPLOYEE(e) AND 
(∃d) (DEPENDENT(d) AND d.Essn= e.Ssn AND 
((∀d1)(DEPENDENT(d1) AND 
(NOT(d1.Essn = e.ssn)) AND (NOT(d=d1))))}
7) Retrieve the names of employees who make at least $10,000 more than the employee who is paid the least in the Company.

{ z.Fname, z.Lname | (∃y)(EMPLOYEE(y) AND 
(NOT (∃x)(EMPLOYEE(x) AND x.salary < y.salary)) AND 
((∃z)(EMPLOYEE(z) AND z.salary >= y.salary+10000))}


8) Retrieve the names of all employees who work in the department that has the employee with the highest salary among all employees.

{ d.Fname, d.Lname | (∃e)(EMPLOYEE(e) AND  
(NOT(∃x)(EMPLOYEE(x) AND x.salary > e.salary)) AND 
(∃d)(EMPLOYEE(d) AND d.Dno = e.Dno ))}

9) Write the domain relational calculus expression for problem 8.16 b)

b.) List the names of all employees who have a dependent with the same first name as them selves.

{q, s |   (∃e) (EMPLOYEE(qrstuvwxyz) AND
(∃d) DEPARTMENT(lmnop) AND  q= m  AND l=t)}

10) Solve problem 8.30 c) only for Domain Relational Calculus.
c.) Domain relational calculus 

{ x, y, z, v, w, | R(xyz) AND (∃u) (S (uvw) AND z=u)}
