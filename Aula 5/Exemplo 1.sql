INSERT INTO conta(numero_conta, saldo, titular, numero_banco)
	               VALUES (202020,1000,'ANTÔNIO',8888);
INSERT INTO conta(numero_conta, saldo, titular, numero_banco)
				   VALUES (202021,2000,'JORGE',9999);
			
BEGIN;
	UPDATE conta SET saldo = saldo - 100 WHERE numero_conta = 202020;
	UPDATE conta SET saldo = saldo + 100 WHERE numero_conta = 202021;
ROLLBACK;

BEGIN;
	UPDATE conta SET saldo = saldo - 100 WHERE numero_conta = 202020;
	UPDATE conta SET saldo = saldo + 100 WHERE numero_conta = 202021;
COMMIT;

SELECT * FROM conta;

SELECT COUNT(*) FROM conta;

INSERT INTO conta(numero_conta, titular, numero_banco)
	               VALUES (202022,'MARIA', 8888);
				 
SELECT COUNT(numero_conta) FROM conta;

SELECT MAX(saldo) FROM conta;/*ver o saldo maximo*/

SELECT MIN(saldo) FROM conta;/*ver o saldo mínimo*/

SELECT SUM(saldo) FROM conta;/*soma coluna*/

SELECT ROUND(AVG(saldo),2) AS MEDIA FROM conta;/*tira media*/