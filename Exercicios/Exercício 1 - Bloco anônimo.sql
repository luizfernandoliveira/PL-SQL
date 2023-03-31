-- Comando utilizado para exibir o first_name, last_name e salary, utilizando a tabela employees
SELECT first_name, last_name, salary
FROM employees;

-- Comando utilizado para exibir o tipo dos arquivos das tabelas
DESC EMPLOYEES;

-- Comando utilizado para exibir o first_name, last_name e salary, utilizando a tabela employees.  
-- Onde o salary é maior que 10000 e commission_pct não é nulo.
SELECT first_name, last_name, salary, commission_pct
FROM employees
where salary > 10000  AND commission_pct IS NOT NULL;

-- Comando utilizado para contar quantas linhas a coluna first_name possui na tabela employees.
SELECT COUNT(first_name)
FROM employees;

-- Comando utilizado para contar quantas linhas a coluna first_name possui na tabela employees sem repetir os nomes.
SELECT COUNT(DISTINCT first_name)
FROM employees;

-- Comando utilizado para contar quantas linhas a coluna first_name possui na tabela employees onde a quantidade é maior que 1.
SELECT count(first_name), first_name
FROM employees
GROUP BY first_name HAVING COUNT(first_name) > 1
ORDER BY count(first_name) DESC;

-- Comando utilizado para ativar DBMS_OUTPUT
SET SERVEROUTPUT ON

-- * Início do Bloco anônimo que exibe o valor de uma variável, utilizando o mesmo tipo de dados (%type)
DECLARE
   vMedia employees.salary%type := 12;
-- Início da lógica do bloco
BEGIN
    DBMS_OUTPUT.PUT_LINE('A média dos salários é ' || vMedia);
END; 



-- ** Início do Bloco anônimo que faz a média de dois salários, utilizando o mesmo tipo de dados (%type)
-- Variáveis declaradas
DECLARE
    vNumero1 employees.salary%type := 5000;
    vNumero2 employees.salary%type := 10000;
    vMedia employees.salary%type;
-- Início da lógica do bloco
BEGIN
    vMedia := (vNumero1 + vNumero2)/2;
    DBMS_OUTPUT.PUT_LINE('A média dos salários é ' || vMedia);
END;

-- ** Fim do bloco anônimo

-- ** Início do Bloco anônimo que faz a média de dois salários.
-- Variáveis declaradas
SET SERVEROUTPUT ON
DECLARE
    vNumero1    NUMBER(11,2) := 5000;
    vNumero2    NUMBER(11,2) := 10000;
    vMedia      NUMBER(11,2);
-- Início da lógica do bloco
BEGIN
    vMedia := (vNumero1 + vNumero2) / 2;
    DBMS_OUTPUT.PUT_LINE('A média dos salários é ' || vMedia);
END; 
-- ** Fim do bloco anônimo


-- ** Início do Bloco anônimo que calcula a receita total, custo total e exibe o balanço
SET SERVEROUTPUT ON
DECLARE
    vReceita1 employees.salary%type := 5500;
    vReceita2 employees.salary%type := 1500;
    vReceita3 employees.salary%type := 500;
    vCusto1   employees.salary%type := 999.99;
    vCusto2   employees.salary%type := 1999.98;
    vCusto3   employees.salary%type := 499.12;
    vCusto4   employees.salary%type := 500.85;
    vReceitaTotal  employees.salary%type;
    vCustoTotal    employees.salary%type;
    vBalanco employees.salary%type;
BEGIN
    vReceitaTotal := vReceita1 + vReceita2 + vReceita3;
    vCustoTotal   := vCusto1 + vCusto2 + vCusto3 + vCusto4;
    vBalanco := vReceitaTotal - vCustoTotal;
    DBMS_OUTPUT.PUT_LINE('Receita Total: R$' || vReceitaTotal  );
    DBMS_OUTPUT.PUT_LINE('Custo Total: R$' || vCustoTotal );
    DBMS_OUTPUT.PUT_LINE('Balanço: R$' || vBalanco  );
EXCEPTION
   WHEN ZERO_DIVIDE THEN
      DBMS_OUTPUT.PUT_LINE('erro divisão por zero');
      DBMS_OUTPUT.PUT_LINE('CÓDIGO DO ERRO: ' || SQLCODE || SQLERRM);
END;
    
    
    
    