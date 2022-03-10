-- 1 exercise
SELECT COUNT(TrackId), p.Name FROM playlisttrack
JOIN playlist p on p.PlaylistId = playlisttrack.PlaylistId
WHERE p.Name = 'Grunge'
GROUP BY PlaylistId;

-- 2 exercise
SELECT * FROM artist
WHERE Name LIKE '%Jack%'AND Name NOT LIKE '%Martin%' OR Name LIKE '%John%'AND Name NOT LIKE '%Martin%' ;

-- 3 exercise
SELECT SUM(Total), BillingCountry FROM invoice
GROUP BY BillingCountry
HAVING SUM(Total)>100
ORDER BY SUM(Total) DESC;

-- 4 exercise
SELECT DISTINCT e.Phone FROM employee AS e, employee AS e1
LEFT JOIN customer c on e1.EmployeeId = c.SupportRepId
LEFT JOIN invoice i on c.CustomerId = i.CustomerId
LEFT JOIN invoiceline i2 on i.InvoiceId = i2.InvoiceId
LEFT JOIN track t on i2.TrackId = t.TrackId
LEFT JOIN mediatype m on t.MediaTypeId = m.MediaTypeId
WHERE t.Composer LIKE 'Miles Davis' AND m.Name LIKE 'MPEG Audio File'
AND e.EmployeeId = e1.ReportsTo;

-- 5 exercise
SELECT DISTINCT Title FROM album
LEFT JOIN track t on album.AlbumId = t.AlbumId
LEFT JOIN genre g on g.GenreId = t.GenreId
WHERE g.Name LIKE 'Bossa Nova' AND t.Name LIKE 'Samba%';

-- 6 exercise
SELECT genre.Name AS 'Genre', AVG((Milliseconds/60000)) AS 'Minutes' FROM genre
LEFT JOIN track t on genre.GenreId = t.GenreId
GROUP BY genre.Name
HAVING MAX(Milliseconds)>1800000;

-- 7 exercise
SELECT COUNT(Company) FROM customer
WHERE Company IS NOT NULL AND State IS NULL;

-- 8 exercise UNDONE couldn't find out how to search for several countries at same time
SELECT COUNT(CustomerId), Country, SupportRepId FROM customer AS c
WHERE c.Country = 'USA' AND SupportRepId IN
(SELECT c2.SupportRepId FROM customer AS c2
WHERE c2.Country = 'Mexico' AND SupportRepId IN
(SELECT c3.SupportRepId FROM customer AS c3
WHERE c3.Country = 'Canada'));


-- 9 exercise
SELECT CONCAT(LastName,', ', FirstName), IFNULL(Fax, 'S/he has no fax') FROM customer
WHERE Country = 'USA'
ORDER BY LastName, FirstName;

-- 10 exercise
SELECT FirstName, LastName, FROM_DAYS(DATEDIFF(HireDate, BirthDate)) FROM employee;
