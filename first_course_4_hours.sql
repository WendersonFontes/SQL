SELECT * 
FROM person.Person;

SELECT Title
FROM person.person;

SELECT *
FROM person.EmailAddress;


--A EQUIPE DE MARKETING PRECISA FAZER UMA PEQUISA SOBRE NOMES MAIS COMUNS DE SEUS CLIENTES 
--E PRECISA DO NOME E SOBRENOME DE TODOS OS CLIENTES QUE ESÃO CADASTRADOS
--NO SISTEMA
SELECT firstName, lastName
FROM person.person;


--REMOVER DUPLICADOS DE UMA TABELA. EX.: TINHA 19000 LINHAS COM OS REPETIDOS E USANDO DISTINCT FICOU 1000 E POUCO
SELECT DISTINCT FirstName
FROM person.Person


--##DESAFIO 2
--QUANTOS NOMES SOBRENOMES ÚNICOS TEMOS EM NOSSA TABELA PERSON.PERSON
SELECT DISTINCT LastName
FROM person.Person



-- WHERE

SELECT coluna1, coluna2, coluna_n
FROM tabela
WHERE condicao;

/*
OPERADOR - DESCRIÇÃO
=          IGUAL
>          MAIOR QUE
<          MENOR QUE
>=         MAIOR OU IGUAL
<=         MENOR OU IGUAL
<>         DIFERENTE DE
AND        OPERADOR LOGICO E
OR         OPERADOR LOGICO OU

*/



SELECT *
FROM production.Product
WHERE color = 'blue' or color = 'black'

 

SELECT *
FROM production.Product
WHERE ListPrice > 1500


SELECT *
FROM production.Product
WHERE ListPrice > 1500 and ListPrice < 5000


--COR DIFERENTE DE VERMELHO - NÃO MOSTRA NENHUM COM VERMELHO
SELECT *
FROM production.Product
WHERE color <> 'red'



--DESAFIO! A EQUIPE DE PRODUÇÃO DE PRODUTOS PRECISA DO NOME DE TODAS AS PEÇAS QUE PESAM MAIS QUE 500 KG MAS NÃO
-- MAIS QUE 700 KG PARA INSPEÇÃO
SELECT name
FROM production.Product
WHERE weight > 500 and weight < 700



--DESAFIO! FOI PEDIDO PELO MARKETING UMA RELAÇÃO DE TODOS OS EMPREGADOS (EMPLOYEES) QUE SÃO CASADOS (SINGLE=SOLTERO, MARRIED=CASADO)
--E SÃO ASALARIADOS(SALARIED)
SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'm' AND SalariedFlag = 1



--DESAFIO 3 
-- UM USUARIO CHAMADO PETER KREBS ESTÁ DEVENDO UM PAGAMENTO, CONSIGA O EMAIL DELE PARA QUE POSSAMOS ENVIAR UMA COBRANÇA!
-- (USAR TABELA PERSON.PERSON E DEPOIS TABELA PERSON.EMAILADRESS)
SELECT *
FROM Person.Person
WHERE FirstName = 'peter' and Lastname = 'krebs'

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = 26


--MINUTO 28:06 - 


 --CONTAR QUANTIDADE LINHAS
SELECT count (*)
FROM person.Person

 --CONTAR QUANTIDADE TÍTULOS
SELECT count (title)
FROM person.Person



 --CONTAR QUANTIDADE TÍTULOS DISTINTOS
SELECT count (DISTINCT title)
FROM person.Person



 --CONTAR QUANTIDADE DE PRODUTOS
SELECT count (*)
FROM Production.Products

 --CONTAR QUANTOS TAMANHOS DE PRODUTOS CADASTRADOS
SELECT count (size)
FROM Production.Products



 --CONTAR QUANTOS TAMANHOS DE PRODUTOS CADASTRADOS
SELECT count (DISTINCT size)
FROM Production.Products



--SELECIONA OS TOP BASEADO NA QTD INFORMADA
SELECT TOP 10 *
FROM Production.Product


-- ORDER BY (SINTAXE)
SELECT coluna1, coluna2
FROM tabela
ORDER BY coluna1 asc/desc



SELECT *
FROM person.Person
ORDER BY FirstName desc


SELECT *
FROM person.Person
ORDER BY FirstName asc, LastName desc


SELECT FirstName, LastName
FROM person.Person
ORDER BY FirstName asc, LastName desc




SELECT FirstName, LastName, MiddleName
FROM person.Person
ORDER BY MiddleName asc



SELECT TOP 4 name, productnumber
FROM Production.product
ORDER BY ProductID asc



SELECT *
FROM Production.Product
WHERE ListPrice between 1000 and 1500;



SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' and '2010/01/01'
ORDER BY HireDate


Nós usamos o operador IN junto com o WHERE, 
para verificar se um valor corresponde com qualquer valor passado na lista de valores

valor IN (valor1, valor2)
valor IN (SELECT valor FROM nomeDATabela)



SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2,7,13)


SELECT *
FROM Person.Person
WHERE BusinessEntityID NOT IN (2,7,13)

--Vamos dizer que você quer encontrar uma pessoa no banco de dados que você sabe que o nome dela era ovi... alguma coisa
SELECT *
FROM Person.Person
WHERE FirstName like 'ovi%'


 
--Quando lembra só do final
SELECT *
FROM Person.Person
WHERE FirstName like '%to'

 
--Para localizar o nome não importa se esteja no começo ou no final, tudo que tem "essa"
SELECT *
FROM Person.Person
WHERE FirstName like '%essa%'


--Para localizar o nome, depois do "o" não aparece outros caracteres "o" no nome por causa do _ ( não é case sensitive)
SELECT *
FROM Person.Person
WHERE FirstName like '%ro_'



--DESAFIO
-- QUANTOS PRODUTOS TEMOS CADASTRADO NO SISTEMA QUE CUSTAM MAIS QUE 1500 DOLARES
SELECT count (ListPrice)
FROM Production.Product
WHERE ListPrice > 1500


--DESAFIO
--QUANTAS PESSOAS TEMOS COM O SOBRENOME QUE INICIA COM A LETRA P?
SELECT count (LastName)
FROM person.Person
WHERE LastName like 'p%'


--DESAFIO
--EM QUANTAS CIDADES ÚNICAS ESTÃO CADASTRADOS NOSSOS CLIENTES?
SELECT count(DISTINCT (City))
FROM person.Address


--DESAFIO
--QUAIS SÃO AS CIDADES ÚNICAS QUE TEMOS CADASTRADAS EM NOSSO SISTEMA?
SELECT DISTINCT (City)
FROM person.Address


--DESAFIO
--QUANTOS PRODUTOS VERMELHOS TEM PREÇO ENTRE 500 A 100 DOLARES?
SELECT COUNT(*)
FROM Production.Product
WHERE color = 'red'
AND ListPrice BETWEEN 500 AND 1000


--DESAFIO
--QUANTOS PRODUTOS CADASTRADOS TEM A PALAVRA 'ROAD' no nome deles?
SELECT COUNT(*)
FROM Production.Product
WHERE name like '%road%';


-- MIN MAX SUM AVG
-- FUNÇÕES DE AGREGAÇÃO BASICAMENTE AGREGAM OU COMBINAM DADOS DE  UMA TABELA EM 1 RESULTADO SÓ


SELECT TOP 10 sum(linetotal) AS "Soma"
FROM Sales.SalesOrderDetail


SELECT TOP 10 MIN (linetotal)
FROM Sales.SalesOrderDetail


SELECT TOP 10 MAX (linetotal)
FROM Sales.SalesOrderDetail


SELECT TOP 10 AVG (linetotal)
FROM Sales.SalesOrderDetail


-- O GROUP BY basicamente divide o resultado da sua pesquisa em grupos 
-- para cada grupo você pode aplciar uma função de agregação, por exemplo
- calcular a soma de itens
- contar o número de itens naquele grupo
sintaxe:
SELECT coluna1, funcaoAgregacao(coluna2)
FROM nomeTabela
GROUP BY coluna1;


SELECT *
FROM Sales.SalesOrderDetail

SELECT SpecialOfferIde, SUM(UnitPrice)
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID



 
SELECT SpecialOfferId, SUM(UnitPrice) AS "SOMA"
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID


SELECT SpecialOfferId, UnitPrice
FROM Sales.SalesOrderDetail
WHERE SpecialOfferID = 9



--QUERO SABER QUANTOS DE CADA PRODUTO FOI VENDIDO ATÉ HOJE
SELECT ProductId, count(ProductId) as "CONTAGEM"
FROM Sales.SalesOrderDetail
GROUP BY ProductID


--VAMOS DIZER QUE EU QUERO SABER QUANTOS NOMES DE CADA NOME TEMOS CADASTRADO EM NOSSO BANCO DE DADOS
SELECT FirstName, COUNT (FirstName) AS "CONTAGEM"
FROM Person.Person
GROUP BY FirstName


--NA TABELA PRODUCTION.PRODUCT EU QUERO SABER A MÉDIA DE PREÇO PARA OS PRODUTOS QUE SÃO PRATAS(SILVER)
SELECT Color, AVG(ListPrice)  "PRECO"
FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color


--DESAFIO
-- EU PRECISO SABER QUANTAS PESSOAS TEM O MESMO MiddleName AGRUPADAS POR MiddleName
SELECT MiddleName, count(MiddleName) AS "QUANTIDADE"
FROM Person.Person
GROUP BY MiddleName


-- DESAFIO
-- EU PRECISO SABER EM MÉDIA QUAL É A QUANTIDADE(QUANTITY) QUE CADA PRODUTO É VENDIDO NA LOJA.
SELECT ProductID, AVG(OrderQty)  "media"
FROM sales.SalesOrderDetail
GROUP BY ProductID 

--DESAFIO
-- EU QUERO SABER QUAIS FORAM AS 10 VENDAS QUE NO TOTAL TIVERAM OS MAIORES VALORES DE VENDA(LINE TOTAL) POR PRODUTO DO MAIOR PARA O MENOR VALOR
SELECT TOP 10 ProductID, SUM (lineTotal)
FROM sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC; 


-- DESAFIO
-- PRECISO SABER QUANTOS PRODUTOS E QUAL É A QUANTIDADE MÉDIA DE PRODUTOS QUE TEMOS CADASTRADOS NAS NOSSAS ORDENS DE SERVIÇO(WorkOrder), 
-- AGRUPADOS POR ProductID
SELECT ProductID, COUNT(ProductId) "contagem",
AVG(OrderQty) as "media"
FROM Production.Workorder
GROUP BY ProductID


--HAVING É BASICAMENTE MUITO USADO EM JUNÇÃO COM O GROUP BY PARA FILTRAR RESULTADOS DE UM AGRUPAMENTO.
-- DE UMA FORMA MAIS SIMPLES GOSTO DE ENTENDER ELE COMO BASICAMENTE UM WHERE PARA DADOS AGRUPADOS.
--SINTAXE:
SELECT coluna1, funcaoAgregacao(coluna2)
FROM nomeTabela
GROUP BY coluna1
HAVING condicao

-- A grande diferença entre HAVING E WHERE
-- É QUE O GROUP BY É APLICADO DEPOIS QUE OS DADOS JÁ FORMA AGRUPADOS, ENQUANTO O WHERE É APLICADO ANTES DOS DADOS
-- SEREM AGRUPADOS.



-- VAMOS DIZER QUE QUEREMOS SABER QUAIS NOMES NO SISTEMA TEM UMA OCORRÊNCIA MAIOR QUE 10 VEZES
SELECT FirstName, count(FirstName) as "Quantidade"
FROM Person.Person
GROUP BY FirstName
HAVING count(firstname) > 10

-- POR EXEMPLO QUEREMOS SABER QUAIS PRODUTOS QUE NO TOTAL DE VENDA ESTÃO ENTRE 162K A 500K
SELECT ProductId,SUM(LineTotal) as "TOTAL"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) between 162000 and 500000


-- VAMOS DIZER QUE QUEREMOS SABER QUAIS NOMES NO SISTEMA TEM UMA OCORRÊNCIA MAIOR QUE 10 VEZES, PORÉM SOMENTE ONDE O TÍTULO É 'MR.'
SELECT FirstName, count(FirstName) as "Quantidade"
FROM Person.Person
WHERE Title = 'Mr.'
GROUP BY FirstName
HAVING count(firstname) > 10


--DESAFIO
--ESTAMOS QURENDO IDENTIFICAR AS PROVÍNCIAS(stateProvinceID) com o maior número de cadastros no nosso sistema, então é preciso encontrar quais províncias
--(stateProvinceID) estão registradas no banco de dados mais que 1000 vezes.
SELECT StateProvinceID, COUNT(stateProvinceID) as "Quantidade"
FROM person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceId) > 1000


--DESAFIO
--SENDO QUE SE TRATA DE UMA MULTINACIONAL, OS GERENTES QUREM SABER QUAIS PRODUTOS(ProductID) NÃO ESTÃO TRAZENDO EM MÉDIA NO MÍNIMO 1 MILHÃO 
-- EM TOTAL DE VENDAS(LineTotal)
SELECT ProductID, AVG(LineTotal)
FROM sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 1000000





SELECT TOP 10 AVG(ListPrice) as "Preço médio"
FROM Production.Product



--DESAFIO
-- ENCONTRAR O FirstName e LAstName Person.person e RENOMEAR PARA PORTUGUÊS
SELECT TOP 10 FirstName as "Nome", LastName as "Sobrenome"
FROM person.Person


--DESAFIO
-- ProductNumber da TABELA Production.Product "Numero do Produto"
SELECT TOP 10 ProductNumber as "Número do Produto"
FROM Production.Product



--DESAFIO
-- sales.SalesOrderDetail unitPrice "Preço Unitário"
SELECT unitPrice as "Preço Unitário"
FROM sales.SalesOrderDetail



--EXISTEM 3 TIPOS GERAIS DE JOINS:
-- INNER JOIN, OUTER JOIN E SELF-JOIN


--EXERCICIO
-- JUNTAR INFORMAÇÕES DE TABELAS DIFERENTES
SELECT p. BusinessEntityID, p. FirstName, p. LastName, pe. EmailAddress
FROM Person.person as P
INNER JOIN Person.Emailaddress PE on p. BusinessEntityID = pe.BusinessEntityID


--VAMOS DIZER QUE NÓS QUEREMOS OS NOMES DOS PRODUTOS E AS INFORMAÇÕES DE SUAS SUBCATEGORIAS
SELECT pr.ListPrice,pr.Name,pc.Name
FROM Production.Product PR
INNER JOIN Production.ProductSubcategory PC on PC.ProductSubcategoryID = pr.ProductSubcategoryID


-- JUNTAR INFORMAÇÕES DE TABELAS COM INFORMAÇÕES EM COMUM
SELECT TOP 10 *
FROM Person.BusinessEntityAddress BA
INNER JOIN Person.Address PA ON PA.AddressID = BA.AddressID



--DESAFIO
-- FAZER A JUNÇÃO DE DUAS TABELAS COM AS COLUNAS SEGUINTES:
--BusinessEntityID, Name, PhoneNumberTypeID, PhoneNumber
SELECT pp.BusinessEntityID,pt.name,pt.PhoneNumberTypeID,pp.PhoneNumber
FROM person.PersonPhone PP
INNER JOIN Person.PhoneNumberType PT ON PT.PhoneNumberTypeID = pp.PhoneNumberTypeID



--DESAFIO
--QUERO AddressID,City, StateProvinceID,Nome do Estado
SELECT TOP 10 PA.AddressID,PA.City,PS.StateProvinceID,PS.Name
FROM Person.Address PA
INNER JOIN Person.StateProvince PS ON PS.StateProvinceID = PA.StateProvinceID



--INNER JOIN
SELECT * FROM TabelaA
INNER JOIN TabelaB
ON TabelaA.Nome = TabeaB.nome




--FULL OUTER JOIN
SELECT * FROM TabelaA
FULL OUTER JOIN TabelaB
ON TabelaA.nome = TabelaB.nome


--LEFT OUTER JOIN
SELECT * FROM TabelaA
LEFT OUTER JOIN TabelaB
ON TabelaA.nome = TabelaB.nome


--LEFT OUTER JOIN
--LEFT JOIN
-- QUERO DESCOBRIR QUAIS PESSOAS TEM UM CARTÃO DE CRÉDITO REGISTRADO

SELECT *
FROM Person.Person PP
INNER JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = PC.BusinessEntityID
--INNER JOIN RETORNOU 19118 LINHAS
-- LEFT JOIN RETORNOU 19972 LINHAS

--PARA SABER AS QUE NÃO TEM CARTÃO REGISTRADO
SELECT *
FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL




-- O OPERADOR UNION COMBINA DOIS OU MAIS RESULTADOS DE UM SELECT EM UM RESULTADO APENAS.
SELECT coluna1, coluna2
FROM tabela1
UNION
SELECT coluna1, coluna2
FROM tabela2




SELECT [ProductID], [Name], [ProductNumber]
 FROM Production.Product
 WHERE Name like '%Chain%'
UNION
SELECT [ProductID],[Name], [ProductNumber]
 FROM Production.Product
 WHERE Name like '%Decal%'





--SE QUISER ORDENAR TAMBÉM PODE:
SELECT [ProductID], [Name], [ProductNumber]
 FROM Production.Product
 WHERE Name like '%Chain%'
UNION
SELECT [ProductID],[Name], [ProductNumber]
 FROM Production.Product
 WHERE Name like '%Decal%'
 ORDER BY Name desc



SELECT FirstName,Title, MiddleName
FROM person.Person
WHERE Title = 'Mr.'
UNION
SELECT FirstName,Title, MiddleName
FROM Person.Person
WHERE MiddleName = 'A'



--EU QUERO TODOS OS CLIENTES QUE MORAM NA MESMA REGIÃO
SELECT A.ContactName,A.Region, B. ContactName, B.Region
FROM CUSTOMERS A,CUSTOMERS B
WHERE A.Region = B.Region



-- EU QUERO ENCONTRAR (NOME E DATA DE CONTRATAÇÃO) DE TODOS OS FUNCIONÁRIOS QUE FORAM CONTRATADOS
-- NO MESMO ANO
SELECT A.firstName, A.hireDate,b.firstName,b.hireDate
FROM Employees A,Employees B
WHERE DATEPART(YEAR,a.hiredate) = DATEPART(YEAR,b.hireDate)


-- EU QUERO SABER NA TABELA DETALHE DO PEDIDO[Order Details] QUAIS PRODUTOS TEM O MESMO PERCENTUAL
-- DE DESCONTO
SELECT A.productID, A.discount,B.productID,B.discount
FROM [Order Details] A, [Order Details]
where A.Discount = B.Discount


--MONTE UM RELATÓRIO PARA MIM DE TODOS OS PRODUTOS CADASTRADOS QUE TEM PREÇO DE VENDA ACIMA DA MÉDIA
SELECT *
FROM Production.Product
WHERE ListPrice > (SELECT AVG(listPrice) FROM ProductionProduct)


--EU QUERO SABER O NOME DOS MEUS FUNCIONÁRIOS QUE TEM O CARGO DE 'DESIGN ENGINEER'
SELECT FirstName
FROM Person.Person
WHERE BusinessEntityID IN (
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer')

--SE QUISER FAZER O MESMO COM O JOIN:
SELECT P.FirstName
FROM Person.Person P
INNER JOIN HumanResources.Employee E ON P.BusinessEntityID = E.BusinessEntityID
AND E.JobTitle = 'Design Engineer'


--INCLUDE ACTUAL EXECUTION PLAN (CTR+M)
--QUANDO ATIVA ELE E RODA O CÓDIGO DA PRA COMPARAR OS DOIS CÓDIGOS E MOSTRA A PORCENTAGE COMPARANDO
-- O QUE OCUPA A MAIOR PORCENTGEM É O QUE GASTA MAIS TEMPO PARA TRAZER O RESULTADO, AI ESCOLHE COM BASE NISSO




--DESAFIO 
-- ENCONTRE TODOS OS ENDEREÇOS QUE ESTÃO NO ESTADO DE 'ALBERTA'
SELECT *
FROM Person.Address
WHERE StateProvinceID IN (
SELECT StateProvinceID FROM person.StateProvince
WHERE Name = 'Alberta'



--PARA SABER O MÊS QUE FOI FEITO O PEDIDO
SELECT SalesOrderID, DATEPART(month,OrderDate) as Mes
FROM Sales.SalesOrderHeader




