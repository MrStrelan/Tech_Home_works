SHOW TABLES ;

-- 1 exercise
SELECT * FROM tmember WHERE cName = 'Jens S.' AND dBirth < '1970-01-01' AND dNewMember > '2012-12-31' AND dNewMember < '2014-01-01';

-- 2 exercise
SELECT * FROM tbook WHERE (NOT nPublishingCompanyID = 32 OR nPublishingYear < 2000 ) AND (NOT nPublishingCompanyID = 15 OR nPublishingYear < 2000 );

-- 3 exercise
SELECT cName, cSurname FROM tmember WHERE (cAddress IS NULL) AND (cPhoneNo IS NOT NULL );

-- 4 exercise
SELECT * FROM tauthor WHERE (cSurname = 'Byatt') AND (cName like BINARY 'A%') and (cName LIKE '%S%');

-- 5 exercise
SELECT COUNT(*) FROM tbook WHERE nPublishingYear = 2007 AND nPublishingCompanyID = 32;

-- 6 exercise
SELECT  COUNT(cCPR), dLoan FROM tloan
WHERE cCPR = 0305393207 AND dLoan > '2013-12-31' AND dLoan < '2015-01-01'
GROUP BY dLoan;

-- 7 exercise
SELECT  COUNT(cCPR), dLoan FROM tloan
WHERE cCPR = '0305393207' AND dLoan > '2013-12-31' AND dLoan < '2014-12-31' AND tloan.cCPR>'1'
GROUP BY dLoan;

-- 8 exercise
SELECT * FROM tmember ORDER BY dNewMember DESC, cSurname, cName;

-- 9 exercise
SELECT cTitle, cName FROM tbook
RIGHT JOIN tbooktheme ON tbook.nBookID = tbooktheme.nBookID
INNER JOIN ttheme on tbooktheme.nThemeID = ttheme.nThemeID
WHERE nPublishingCompanyID = '32';

-- 10 exercise
SELECT cName, cSurname, COUNT(nBookID)FROM tauthor
INNER JOIN tauthorship ON tauthor.nAuthorID=tauthorship.nAuthorID
GROUP BY tauthorship.nAuthorID;

-- 11 exercise
SELECT cName, cSurname, cTitle, MIN(nPublishingYear) FROM tauthor
LEFT JOIN tauthorship t on tauthor.nAuthorID = t.nAuthorID
LEFT JOIN tbook t2 on t.nBookID = t2.nBookID
WHERE t2.nBookID IS NOT NULL
GROUP BY cName, cSurname;

-- 12 exercise
SELECT cTitle, cName, cSurname FROM tbook
INNER JOIN tbookcopy t on tbook.nBookID = t.nBookID
INNER JOIN tloan t2 on t.cSignature = t2.cSignature
INNER JOIN tmember t3 on t2.cCPR = t3.cCPR;

-- 13 exercise
-- did it with 'join' from the start

-- 14 exercise
SELECT cName, t2.cTitle FROM ttheme
LEFT JOIN tbooktheme t on ttheme.nThemeID = t.nThemeID
LEFT JOIN tbook t2 on t.nBookID = t2.nBookID
ORDER BY ttheme.cName;

-- 15 exercise
SELECT cName, cSurname, cTitle, dLoan FROM tmember
LEFT JOIN tloan t on tmember.cCPR = t.cCPR
LEFT JOIN tbookcopy t2 on t.cSignature = t2.cSignature
LEFT JOIN tbook t3 on t2.nBookID = t3.nBookID
WHERE dNewMember BETWEEN '2013-01-01' AND '2013-12-31' AND dLoan BETWEEN '2013-01-01' AND '2013-12-31'
OR dNewMember BETWEEN '2013-01-01' AND '2013-12-31' AND dLoan IS NULL;

-- 16 exercise
SELECT tauthor.cName, cSurname, t2.cName, t4.cTitle FROM tauthor
LEFT JOIN tnationality t on tauthor.nAuthorID = t.nAuthorID
LEFT JOIN tcountry t2 on t.nCountryID = t2.nCountryID
LEFT JOIN tauthorship t3 on tauthor.nAuthorID = t3.nAuthorID
LEFT JOIN tbook t4 on t3.nBookID = t4.nBookID;

-- 17 exercise
SELECT cTitle FROM tbook AS t
WHERE t.nPublishingYear = '1970' AND
t.cTitle IN (SELECT t1.cTitle FROM tbook AS t1
WHERE t1.nPublishingYear = '1989' );

-- 18 exercise
SELECT cSurname, cName FROM tmember
WHERE dNewMember BETWEEN '2013-12-01' AND '2013-12-31'
UNION
SELECT cSurname, cName FROM tauthor
WHERE cName = 'William';

-- 19 exercise
SELECT cName, cSurname FROM tmember
WHERE dNewMember = (SELECT MIN(dNewMember) FROM tmember);

-- 20 exercise
SELECT  COUNT(cTitle), nPublishingYear, t.nPublishingCompanyID FROM tbook
LEFT JOIN tpublishingcompany t on tbook.nPublishingCompanyID = t.nPublishingCompanyID
LEFT JOIN tnationality t2 on t.nCountryID = t2.nCountryID
WHERE nAuthorID IN
(SELECT nAuthorID FROM tauthor
GROUP BY tauthor.cName
HAVING COUNT(tauthor.nAuthorID)>2)
GROUP BY nPublishingYear;

-- 21 exercise
SELECT tpublishingcompany.cName AS 'Name', t.cName AS 'Country' FROM tpublishingcompany
LEFT JOIN tcountry t on tpublishingcompany.nCountryID = t.nCountryID;

-- 22 exercise
SELECT cTitle FROM tbook
WHERE nPublishingYear BETWEEN '1926' AND '1978' AND nPublishingCompanyID != '32';

-- 23 exercise
SELECT cName, cSurname FROM tmember
WHERE dNewMember > '2016-12-31' AND cAddress IS NULL ;

-- 24 exercise
SELECT DISTINCT t.nCountryID FROM tcountry
INNER JOIN tpublishingcompany t on tcountry.nCountryID = t.nCountryID;

-- 25 exercise
SELECT cTitle FROM tbook
LEFT JOIN tpublishingcompany t on tbook.nPublishingCompanyID = t.nPublishingCompanyID
WHERE cTitle like 'The Tale%' AND cName NOT LIKE 'Lynch Inc';

-- 26 exercise
SELECT DISTINCT ttheme.cName FROM ttheme
INNER JOIN tbooktheme t on ttheme.nThemeID = t.nThemeID
INNER JOIN tbook t2 on t.nBookID = t2.nBookID
INNER JOIN tpublishingcompany t3 on t2.nPublishingCompanyID = t3.nPublishingCompanyID
WHERE t3.cName like 'Lynch Inc';

-- 27 exercise
SELECT cTitle FROM tbook
LEFT JOIN tbookcopy t on tbook.nBookID = t.nBookID
LEFT JOIN tloan t2 on t.cSignature = t2.cSignature
WHERE t2.dLoan IS NULL ;

-- 28 exercise
SELECT COUNT(*) AS 'No. of Books', nPublishingCompanyID FROM tbook
GROUP BY nPublishingCompanyID;

-- 29 exercise
SELECT COUNT(cCPR) FROM tloan
WHERE dLoan BETWEEN '2013-01-01' AND '2013-12-31';

-- 30 exercise
SELECT cTitle, COUNT(cName) AS 'No. of Authors' FROM tauthor
LEFT JOIN tauthorship t on tauthor.nAuthorID = t.nAuthorID
LEFT JOIN tbook t2 on t.nBookID = t2.nBookID
GROUP BY cTitle
HAVING COUNT(cName)>1;

