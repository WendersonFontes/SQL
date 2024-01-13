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
