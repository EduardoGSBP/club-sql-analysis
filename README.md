# 🏸 Club Database SQL Analysis

Este projeto explora o banco de dados fictício de um clube utilizando SQL puro.

## 🎯 Objetivo
Demonstrar domínio dos comandos SQL básicos e intermediários por meio de consultas analíticas e condicionais.

## 📂 Estrutura do Banco
- **facilities** — instalações (quadras, academia, piscina etc.)
- **members** — membros do clube
- **bookings** — reservas realizadas pelos membros

## ⚙️ Tópicos abordados
- `SELECT`, `WHERE`, `ORDER BY`
- `LIKE`, `IN`, `BETWEEN`
- `JOIN`
- `GROUP BY`
- `CASE`
- Expressões condicionais e classificação de dados

## 🧠 Exemplos de consultas
```sql
-- Facilities com "Tennis" no nome
SELECT facid, name
FROM facilities
WHERE name LIKE '%Tennis%';

-- Membros que se juntaram após setembro de 2012
SELECT memid, surname, firstname, joindate
FROM members
WHERE joindate > '2012-09-01';
