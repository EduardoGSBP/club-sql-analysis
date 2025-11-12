-- Club Database SQL Analysis
-- Autor: Eduardo Gabriel Santos Bretas Pinheiro
-- Projeto demonstrando domínio de SQL básico com o banco de dados de um clube fictício.

-- 1. Selecionar todas as instalações
SELECT * FROM facilities;

-- 2. Selecionar todos os membros
SELECT * FROM members;

-- 3. Facilities que cobram taxa de membros
SELECT facid, name, membercost
FROM facilities
WHERE membercost > 0;

-- 4. Facilities com "Tennis" no nome
SELECT facid, name
FROM facilities
WHERE name LIKE '%Tennis%';

-- 5. Facilities com IDs 1 e 5 (sem OR)
SELECT *
FROM facilities
WHERE facid IN (1, 5);

-- 6. Membros que entraram após 1º de setembro de 2012
SELECT memid, surname, firstname, joindate
FROM members
WHERE joindate > '2012-09-01';

-- 7. Facilities com taxa menor que 1/50 do custo mensal
SELECT facid, name, membercost, monthlymaintenance
FROM facilities
WHERE membercost > 0
  AND membercost < (monthlymaintenance / 50);

-- 8. Facilities ordenadas pelo custo de manutenção
SELECT name, monthlymaintenance
FROM facilities
ORDER BY monthlymaintenance DESC;

-- 9. Top 5 facilities mais caras para membros
SELECT name, membercost
FROM facilities
WHERE membercost > 0
ORDER BY membercost DESC
LIMIT 5;

-- 10. Reservas com nome do membro e da instalação
SELECT b.bookid, m.firstname, m.surname, f.name AS facility, b.starttime
FROM bookings AS b
JOIN members AS m ON b.memid = m.memid
JOIN facilities AS f ON b.facid = f.facid;

-- 11. Quantidade de reservas por membro
SELECT memid, COUNT(*) AS total_bookings
FROM bookings
GROUP BY memid
ORDER BY total_bookings DESC;

-- 12. Classificação das facilities por manutenção
SELECT name,
       monthlymaintenance,
       CASE
           WHEN monthlymaintenance > 200 THEN 'Alta manutenção'
           WHEN monthlymaintenance BETWEEN 100 AND 200 THEN 'Média manutenção'
           ELSE 'Baixa manutenção'
       END AS tipo_manutencao
FROM facilities;
