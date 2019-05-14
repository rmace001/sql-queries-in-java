--Find the total number of parts supplied by each supplier

SELECT sname, COUNT(*)
FROM Parts NATURAL JOIN Suppliers NATURAL JOIN Catalog
GROUP BY sname;

--find the total number of parts supplied by each supplier who supplied at least three parts
SELECT sname, COUNT(*)
FROM Parts NATURAL JOIN Suppliers NATURAL JOIN Catalog
GROUP BY sname
HAVING count(*) > 2;

--for every supplier that supplies only green parts, print the name of the supplier
--and the total number of parts that he/she supplies

SELECT sname, COUNT(*)
FROM Parts P NATURAL JOIN Suppliers S NATURAL JOIN Catalog C
WHERE S.sid not in (select C2.sid
					FROM Catalog C2 natural join Parts P2
					where P2.color <> 'Green')
GROUP BY sname;

--for every supplier that supplies a green part and a red part, print the name of 
--the supplier and the price of the most expensive part that they supply


select sname, max(cost)
from Parts P natural join Suppliers S natural join Catalog C
where S.sid in (select S2.sid
		from Suppliers S2 natural join Catalog C2 natural join Parts P2
		where P2.color = 'Red'
		intersect
		select S3.sid
		from Suppliers S3 natural join Catalog C3 natural join Parts P3
		where P3.color = 'Green')
group by sname;



--Q5
select pname
from Parts P natural join Catalog C 
where c.cost < input;

--Q6
select address 
from Parts P natural join Catalog C natural join Suppliers S 
where P.name = input;









