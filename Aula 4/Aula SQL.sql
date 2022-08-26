CREATE TABLE setor(codigo_setor SERIAL PRIMARY KEY, nome varchar(20) NOT NULL UNIQUE);

CREATE TABLE empregado(matricula int  PRIMARY KEY, nome VARCHAR(40) NOT NULL,
					 email VARCHAR(30) UNIQUE, codigo_setor int, 
					 FOREIGN KEY (codigo_setor) REFERENCES setor(codigo_setor) ON UPDATE CASCADE ON DELETE NO ACTION);
					 
INSERT INTO setor (nome) VALUES ('RH');
INSERT INTO setor (nome) VALUES('CPD');
INSERT INTO setor (nome) VALUES('COMPRAS');

INSERT INTO empregado (matricula, nome, email, codigo_setor) VALUES(123,'JOÃO DA SILVA','joao@gmail.com',1);
INSERT INTO empregado (matricula, nome, email, codigo_setor) VALUES(1234,'ANA DA SILVA','ana@gmail.com',2);
UPDATE setor SET codigo_setor=100 WHERE codigo_setor=1;
DELETE FROM setor WHERE codigo_setor=100;

SELECT * FROM setor;
SELECT * FROM empregado;

CREATE TABLE agencia(numero_banco int PRIMARY KEY,
					 numero_agencia int NOT NULL,
					 nome_banco VARCHAR(40) NOT NULL);


CREATE TABLE conta(numero_conta int PRIMARY KEY,
				  saldo NUMERIC,
				  titular VARCHAR(40) NOT NULL,
				  numero_banco int,
				  FOREIGN KEY (numero_banco) REFERENCES agencia(numero_banco) ON UPDATE CASCADE ON DELETE CASCADE);
				  
INSERT INTO agencia (numero_banco,numero_agencia, nome_banco) VALUES (4545,123,'ITAU');
INSERT INTO agencia (numero_banco,numero_agencia, nome_banco) VALUES (9999,456,'BRADESCO');
INSERT INTO agencia (numero_banco,numero_agencia, nome_banco) VALUES (8888,789,'NUBANK');

INSERT INTO conta(numero_conta, saldo, titular, numero_banco) VALUES (123, 321,'gabriel',4545);
INSERT INTO conta(numero_conta, saldo, titular, numero_banco) VALUES (1234, 3221,'ana',9999);

DELETE FROM agencia WHERE numero_banco = 4545;

SELECT * FROM conta;
SELECT * FROM agencia ORDER;

INSERT INTO agencia (numero_banco,numero_agencia, nome_banco) VALUES (45451,123,'BANCO DO BRASIL');
INSERT INTO agencia (numero_banco,numero_agencia, nome_banco) VALUES (99991,456,'CAIXA');
INSERT INTO agencia (numero_banco,numero_agencia, nome_banco) VALUES (88881,789,'SANTANDER');

SELECT * FROM agencia WHERE nome_banco ILIKE '%L'

SELECT * FROM agencia WHERE nome_banco ='CAIXA'

SELECT * FROM conta WHERE NOT saldo > 500

SELECT * FROM conta WHERE  saldo BETWEEN 320 AND 500

SELECT * FROM conta WHERE saldo IN (320,321) 

--JOIN
SELECT c.titular, c.saldo, c.numero_conta, a.nome_banco FROM conta AS c, agencia AS a
WHERE c.numero_banco = a.numero_banco;
