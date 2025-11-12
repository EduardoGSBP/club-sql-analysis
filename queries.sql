-- Club Database SQL Analysis
-- Autor: Eduardo Gabriel Santos Bretas Pinheiro
-- Este projeto demonstra domínio de SQL básico utilizando o banco de dados de um clube fictício.
-- Cada consulta foi escrita de forma explicativa para facilitar o aprendizado.

-------------------------------------------------------------
-- 1. Exibir todas as instalações disponíveis no clube
-- Retorna todas as colunas da tabela facilities.
-------------------------------------------------------------
SELECT * FROM facilities;

-------------------------------------------------------------
-- 2. Exibir todos os membros cadastrados no clube
-- Retorna todas as colunas da tabela members.
-------------------------------------------------------------
SELECT * FROM members;

-------------------------------------------------------------
-- 3. Listar apenas as instalações que cobram taxa de membros
-- Mostra o ID, nome e custo para membros das instalações
-- onde o valor de membercost é maior que zero.
-------------------------------------------------------------
SELECT facid, name, membercost
FROM facilities
WHERE membercost > 0;

-------------------------------------------------------------
-- 4. Listar instalações que possuem a palavra "Tennis" no nome
-- Utiliza o operador LIKE com o caractere curinga (%) 
-- para localizar qualquer nome que contenha "Tennis".
-------------------------------------------------------------
SELECT facid, name
FROM facilities
WHERE name LIKE '%Tennis%';

-------------------------------------------------------------
-- 5. Selecionar as instalações com IDs 1 e 5
-- Usa o operador IN em vez do OR para simplificar a condição.
-------------------------------------------------------------
SELECT *
FROM facilities
WHERE facid IN (1, 5);

-------------------------------------------------------------
-- 6. Listar os membros que se juntaram após 1º de setembro de 2012
-- Compara o campo de data joindate com a data '2012-09-01'.
-------------------------------------------------------------
SELECT memid, surname, firstname, joindate
FROM members
WHERE joindate > '2012-09-01';

-------------------------------------------------------------
-- 7. Listar as instalações que cobram taxa menor que 1/50 do custo mensal
-- Calcula se o valor de membercost é menor que monthlymaintenance / 50.
-------------------------------------------------------------
SELECT facid, name, membercost, monthlymaintenance
FROM facilities
WHERE membercost > 0
  AND membercost < (monthlymaintenance / 50);

-------------------------------------------------------------
-- 8. Ordenar as instalações pelo custo de manutenção mensal (decrescente)
-- As mais caras aparecem primeiro.
-------------------------------------------------------------
SELECT name, monthlymaintenance
FROM facilities
ORDER BY monthlymaintenance DESC;

-------------------------------------------------------------
-- 9. Exibir as 5 instalações mais caras para membros
-- Ordena pelo custo cobrado aos membros e limita a 5 resultados.
-------------------------------------------------------------
SELECT name, membercost
FROM facilities
WHERE membercost > 0
ORDER BY membercost DESC
LIMIT 5;

-------------------------------------------------------------
-- 10. Mostrar todas as reservas com o nome do membro e da instalação
-- Realiza junção entre bookings, members e facilities.
-------------------------------------------------------------
SELECT b.bookid, m.firstname, m.surname, f.name AS facility, b.starttime
FROM bookings AS b
JOIN members AS m ON b.memid = m.memid
JOIN facilities AS f ON b.facid = f.facid;

-------------------------------------------------------------
-- 11. Contar quantas reservas cada membro realizou
-- Usa GROUP BY para agrupar por membro e COUNT() para contar as reservas.
-------------------------------------------------------------
SELECT memid, COUNT(*) AS total_bookings
FROM bookings
GROUP BY memid
ORDER BY total_bookings DESC;

-------------------------------------------------------------
-- 12. Classificar as instalações de acordo com o custo de manutenção
-- Usa uma expressão CASE para categorizar o nível de manutenção.
-------------------------------------------------------------
SELECT name,
       monthlymaintenance,
       CASE
           WHEN monthlymaintenance > 200 THEN 'Alta manutenção'
           WHEN monthlymaintenance BETWEEN 100 AND 200 THEN 'Média manutenção'
           ELSE 'Baixa manutenção'
       END AS tipo_manutencao
FROM facilities;

